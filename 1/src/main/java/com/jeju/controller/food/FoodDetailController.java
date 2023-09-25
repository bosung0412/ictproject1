package com.jeju.controller.food;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeju.controller.SuperClass;
import com.jeju.model.bean.Food;
import com.jeju.model.dao.FoodDao;

public class FoodDetailController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		super.doGet(request, response);
		super.gotoPage("food/foodDetail.jsp");
		
		
		
		/* DB연결이후 사용예정
		 * Integer no = Integer.parseInt(request.getParameter("no")); FoodDao dao = new
		 * FoodDao() ; Food bean = null ;
		 * 
		 * try { bean = dao.getDataByPrimaryKey(no);
		 * 
		 * if(bean == null) { super.setAlertMessage("잘못된 게시물 번호입니다.");
		 * super.gotoPage("home.jsp"); }else { request.setAttribute("bean", bean) ;
		 * super.gotoPage("food/foodDetail.jsp"); } } catch (Exception e) {
		 * e.printStackTrace(); }
		 */
	}
}
