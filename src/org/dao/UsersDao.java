package org.dao;

import java.sql.SQLException;

import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.util.C3p0Util;
import org.vo.StudentInfo;
import org.vo.TeachList;
import org.vo.Users;
import org.vo.StuList;

public class UsersDao {

	private QueryRunner runner = new QueryRunner(C3p0Util.getDs());
	
	//登录查询
	public Users queryUserAll(Users user) {
		
		try {
			return runner.query("select * from users where u_tel = ? and u_paswd = ? and u_type = ?", new BeanHandler<Users>(Users.class),
					user.getU_tel(),user.getU_paswd(),user.getU_type());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return user;
	}
	
	public List<StuList> vagueQuery(String name){
		List<StuList> ulist = null;
		String sql = "select * from users a,stuinfo s where a.u_num=s.stu_num and s.stu_name";

		String str = sql+" like '%"+name+"%'";

		try {
			ulist = runner.query(str,new BeanListHandler<StuList>(StuList.class));
			return ulist;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	public List<StudentInfo> getUserPage(int pageNum, int pageSize, Map map){
		String sql = "select * from stuinfo where 1 = 1 ";
		if (map.get("key") != null && !map.get("key").toString().equals("")) {
			sql += " and stu_name like  '%" + map.get("key").toString() + "%'";
		}
		sql += " limit ?,? ";
		int startNo = (pageNum - 1) * pageSize;
		List<StudentInfo> list = null;
		try {
			list = runner.query(sql, new BeanListHandler<StudentInfo>(StudentInfo.class), new Object[] { startNo, pageSize });// 添加实体类的适配器进行类的反射
			return list;
		} catch (SQLException e) {// 捕获异常
			throw new RuntimeException(e);// 抛出运行异常
		}


	}

	public int queryUserCount(Map map) throws SQLException {

		String sql ="select count(*) from stuinfo where 1=1";
		if (map.get("key") != null && !map.get("key").toString().equals("")) {
			sql += " and stu_name like  '%" + map.get("key").toString() + "%'";
		}

		 Long count = (Long) runner.query(sql,new ScalarHandler<>());

		 return count.intValue();
	}


	//根据id查询用户
	public StudentInfo queryUserById(int id) throws SQLException {
		return runner.query("select * from stuinfo where stu_id=?",new BeanHandler<>(StudentInfo.class),id);
	}

	//两表查询用户
	public List<StuList> queryAllUsers(){

		try {
			List<StuList> ulist = null;
			ulist= runner.query("select * from users a,stuinfo s where a.u_num=s.stu_num ",new BeanListHandler<StuList>(StuList.class));
			return ulist;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	//添加用户
	public boolean insertUsers(Users users){
		boolean l = false;
		int i;
		try {
			i = runner.update("insert into users(u_num,u_paswd,u_type,u_tel,create_time) values(?,?,?,?,NOW())",users.getU_num(),users.getU_paswd(), users.getU_type(),users.getU_tel());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		if(i==1){
			l = true;
		}
		return l;
	}

	//添加学生用户
	public boolean insertStuINFO(StudentInfo info){
		int i ;
		boolean l =false;
		try {
			i =runner.update("insert into stuinfo(stu_num,stu_name,stu_sex,stu_age,stu_class,stu_major,stu_college,stu_Intake,stu_gradution,create_time,or_gradute) values(?,?,?,?,?,?,?,?,?,?,NOW())",info.getStu_num(),info.getStu_name(),info.getStu_age(),info.getStu_class(),info.getStu_major(),info.getStu_college(),info.getOr_gradute());
		if(i==1){
			l = true;
		}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return l;
	}

	//查询教师用户信息
	public List<TeachList> queryTeachers(){
		List<TeachList> tlist = null;
		try {
			tlist = runner.query("select * from users u,teacherinfo tf where u.u_num=tf.tea_num and 1=1 and u.u_type='2'",new BeanListHandler<TeachList>(TeachList.class));
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return tlist;
	}

}
