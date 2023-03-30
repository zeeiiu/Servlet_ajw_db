package edu.global.ex.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import edu.global.ex.vo.DeptVO;

public class DeptDAO {

	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String uid = "scott";
	private String upw = "tiger";

	public DeptDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<DeptVO> deptSelect() {
		List<DeptVO> vos = new ArrayList<DeptVO>();

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			String sql = "Select * from dept";

			con = DriverManager.getConnection(url, uid, upw);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int deptno = rs.getInt("deptno");
				String loc = rs.getString("loc");
				String dname = rs.getString("dname");

				DeptVO vo = new DeptVO(deptno, dname, loc);
				vos.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return vos;

	}

}