package com.jeju.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jeju.model.bean.Food;
import com.jeju.utility.Paging;

public class FoodDao extends SuperDao {
	
		// 검색어를 받아서 테이블의 총 행 개수를 구합니다. (전체)
		public int GetTotalRecordCount(String mode, String keyword) throws Exception{
			System.out.print("검색할 필드명 (칼럼명) : " + mode);
			System.out.println(" / 검색할 키워드 : " + keyword);
			
			
			String sql = " select count(*) as cnt from foodiespot " ;
			
			if (mode == null || mode.equals("all")) {
				// 전체 모드, 또는 입력값이 안들어왔을경우
				
			} else {
				// 전체 모드가 아니라면,
				sql += " where " + mode + " like '%" + keyword + "%' " ;
			}
			
			PreparedStatement pstmt = null ;
			ResultSet rs = null ;
			
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			
			rs = pstmt.executeQuery() ; 
			
			int cnt = -1 ;
			
			if(rs.next()) {
				cnt = rs.getInt("cnt") ;
			}
			
			if(rs!=null) {rs.close();}
			if(pstmt!=null) {pstmt.close();}
			if(conn!=null) {conn.close();}
			
			System.out.println("입력된 sql 문장 : " + sql);
			System.out.println("표시할 게시물의 개수 : " + cnt);
			return cnt;
		}
		
		// GetTotalRecordCount 오버라이딩 (category를 변수로 받음)
		public int GetTotalRecordCount(String mode, String keyword, String category) throws Exception{
			System.out.print("검색할 필드명 (칼럼명) : " + mode);
			System.out.println(" / 검색할 키워드 : " + keyword);
			
			
			String sql = " select count(*) as cnt from foodiespot " ;
			
			// 카테고리에 따라 분기
			if (category == "ko") {
				sql += " where category = '한식' " ;
				
			} else if (category == "fo") {
				sql += " where category = '세계음식' " ;
				
			} else if (category == "ca") {
				sql += " where category = '카페' " ;
				
			} else if (category == "be") {
				sql += " where category = '술집' " ;
				
			}
			
			// 검색 조건에 따라 분기
			if (mode == null || mode.equals("all")) {
				// 전체 모드, 또는 입력값이 안들어왔을경우
				
			} else {
				// 전체 모드가 아니라면,
				sql += " and " + mode + " like '%" + keyword + "%' " ;
			}
			
			PreparedStatement pstmt = null ;
			ResultSet rs = null ;
			
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			
			rs = pstmt.executeQuery() ; 
			
			int cnt = -1 ;
			
			if(rs.next()) {
				cnt = rs.getInt("cnt") ;
			}
			
			if(rs!=null) {rs.close();}
			if(pstmt!=null) {pstmt.close();}
			if(conn!=null) {conn.close();}
			
			System.out.println("입력된 sql 문장 : " + sql);
			System.out.println("표시할 게시물의 개수 : " + cnt);
			return cnt;
		}
		
		// 페이징 클래스의 객체를 매개변수로 받아서 조건에 맞는 목록 반환하기
		// TopN 구문을 사용하여 페이징 처리된 게시물 목록을 반환하는 것임
		public List<Food> selectAll(Paging pageInfo) throws Exception {

			PreparedStatement pstmt = null ;
			ResultSet rs = null ;
			
			String sql = " select no, id, category, title, time, breaktime, phoneno, menu, place, map, image1, image2, image3, image4, image5, likes, regdate " ;
			
			sql += " from (select no, id, category, title, time, breaktime, phoneno, menu, place, map, image1, image2, image3, image4, image5, likes, regdate, rank() over(order by no desc) as ranking " ;
			sql += " from foodiespot " ;
			
			String mode = pageInfo.getMode();
			String keyword = pageInfo.getKeyword();
			if (mode == null || mode.equals("all")) {
				// 전체 모드, 또는 입력값이 안들어왔을경우

			} else {
				// 전체 모드가 아니라면,
				sql += " where " + mode + " like '%" + keyword + "%' " ;
			}
			
			sql += " ) " ;
			sql += " where ranking between ? and ? " ;
			
			conn = super.getConnection();
			
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setInt(1, pageInfo.getBeginRow());
			pstmt.setInt(2, pageInfo.getEndRow());
			
			rs = pstmt.executeQuery() ;
			
			List<Food> lists = new ArrayList<Food>();
			
			while(rs.next()) {
				lists.add(getBeanData(rs)) ;
			}
			
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(conn != null) {conn.close();}
			
			return lists;
		}
		
		// selectAll 오버라이딩 (카테고리 변수 받기)
		public List<Food> selectAll(Paging pageInfo, String category) throws Exception {

			PreparedStatement pstmt = null ;
			ResultSet rs = null ;
			
			String sql = " select no, id, category, title, time, breaktime, phoneno, menu, place, map, image1, image2, image3, image4, image5, likes, regdate " ;
			
			sql += " from (select no, id, category, title, time, breaktime, phoneno, menu, place, map, image1, image2, image3, image4, image5, likes, regdate, rank() over(order by no desc) as ranking " ;
			sql += " from foodiespot " ;
			
			// 카테고리에 따라 분기
			if (category == "ko") {
				sql += " where category = '한식' " ;
				
			} else if (category == "fo") {
				sql += " where category = '세계음식' " ;
				
			} else if (category == "ca") {
				sql += " where category = '카페' " ;
				
			} else if (category == "be") {
				sql += " where category = '술집' " ;
				
			}
			
			// 검색 조건에 따라 분기
			String mode = pageInfo.getMode();
			String keyword = pageInfo.getKeyword();
			if (mode == null || mode.equals("all")) {
				// 전체 모드, 또는 입력값이 안들어왔을경우
					
			} else {
				// 전체 모드가 아니라면,
				sql += " and " + mode + " like '%" + keyword + "%' " ;
			}
			
			sql += " ) " ;
			sql += " where ranking between ? and ? " ;
			
			conn = super.getConnection();
			
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setInt(1, pageInfo.getBeginRow());
			pstmt.setInt(2, pageInfo.getEndRow());
			
			rs = pstmt.executeQuery() ;
			
			List<Food> lists = new ArrayList<Food>();
			
			while(rs.next()) {
				lists.add(getBeanData(rs)) ;
			}
			
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(conn != null) {conn.close();}
			
			return lists;
		}
	
		// 게시물 목록을 게시물 번호 역순 정렬하여 반환한다.
		public List<Food> selectAll() throws Exception {
			PreparedStatement pstmt = null;
			// rs : 컴퓨터 메모리에 놓여있는 n행 n열의 테이블같은것
			ResultSet rs = null;
			
			String sql = " SELECT * FROM foodiespot order by no desc";
			
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			List<Food> lists = new ArrayList<Food>();
			
			while(rs.next()) {
				Food bean = new Food();
				bean = getBeanData(rs);
				lists.add(bean);

			}
			
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(conn != null) {conn.close();}
			
			return lists;
		}

		// ResultSet 정보를 bean으로 만들어서 반환해 줍니다.
		private Food getBeanData(ResultSet rs) throws Exception {
			Food bean = new Food();
			
			bean.setNo(rs.getString("no"));
			bean.setId(rs.getString("id"));
			bean.setCategory(rs.getString("category"));
			bean.setTitle(rs.getString("title"));
			bean.setTime(rs.getString("time"));
			bean.setBreaktime(rs.getString("breaktime"));
			bean.setPhoneno(rs.getString("phoneno"));
			bean.setMenu(rs.getString("menu"));
			bean.setPlace(rs.getString("place"));
			bean.setMap(rs.getString("map"));
			bean.setImage1(rs.getString("image1"));
			bean.setImage2(rs.getString("image2"));
			bean.setImage3(rs.getString("image3"));
			bean.setImage4(rs.getString("image4"));
			bean.setImage5(rs.getString("image5"));
			bean.setLikes(rs.getInt("likes"));
			bean.setRegdate(rs.getString("regdate"));
		
			return bean;
		}

		// 기본키 정보를 이용하여 Bean 객체를 구한다.
		public Food getDataByPrimarykey(String no) throws Exception {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = " SELECT * FROM foodiespot where no=?";
			
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, no);
			
			rs = pstmt.executeQuery();
			
			Food bean = null;
			
			if (rs.next()) {
				bean = getBeanData(rs);
			}	
				
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(conn != null) {conn.close();}
			
			return bean;
		}
		
		
	
	
}
