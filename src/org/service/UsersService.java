package org.service;

import org.dao.UsersDao;
import org.vo.StudentInfo;
import org.vo.TeachList;
import org.vo.Users;
import org.vo.StuList;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class UsersService {

	UsersDao  udao = new UsersDao();
	
	public Users queryUserAll(Users user) {
	
		return udao.queryUserAll(user);
	}

	public List<StudentInfo> queryStuInfo(int pageNum, int pageSize, Map map) throws SQLException {
		return udao.getUserPage(pageNum,pageSize,map);
	}

	public List<StudentInfo> getUserPage(int pageNum, int pageSize, Map map){

		return udao.getUserPage(pageNum,pageSize,map);
	}

	public int queryUserCount(Map map) throws SQLException {
		return udao.queryUserCount(map);
	}

	public StudentInfo queryUserByid(int id){

		try {
			return udao.queryUserById(id);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<StuList> queryUserlist(){

		return udao.queryAllUsers();
	}

	public List<StuList> vagueQuery(String name){
		return udao.vagueQuery(name);
	}

	public List<TeachList> queryTeachers(){
		return udao.queryTeachers();
	}

}
