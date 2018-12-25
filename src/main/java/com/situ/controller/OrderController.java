package com.situ.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.model.OrderModel;
import com.situ.model.productModel;
import com.situ.service.OrderService;

import st.tool.FormatEmpty;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	@RequestMapping("/add")
	@ResponseBody
	private String add(OrderModel order) {
		String order_code=order.getOrder_code();
		String pro_code=order.getPro_code();
		String amount=order.getAmount();
		String price=order.getPrice();
		OrderModel mm=new OrderModel();
		mm.setOrder_code(order_code);
		mm.setPro_code(pro_code);
		mm.setAmount(amount);
		mm.setPrice(price);
		
		return orderService.insert(mm);
		
	}
	
	
	@RequestMapping(value = "/getlist", produces = "application/json; charset=UTF-8")
	@ResponseBody
	private String getlist(String code) {
		OrderModel model = new OrderModel();
		model.setPro_code(code);
		
		List<OrderModel> model1=orderService.selectAll(model);
		return new JSONArray(model1).toString();
	}
	@RequestMapping("/delOrderbyId")
	@ResponseBody
	private String delOrderbyId(String id) {
		OrderModel model = new OrderModel();
		model.setId(Integer.parseInt(id));
		return orderService.delete(model);
	}
	@RequestMapping("/delOrder")
	@ResponseBody
	private String delUser(String code) {
		OrderModel model = new OrderModel();
		model.setCode(code);
		return orderService.deleteModel(model);
	}

	@RequestMapping(value = "/getList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getList(OrderModel orderModel) {
		String code = orderModel.getCode();
		String code1 = "%" + code + "%";
		OrderModel model = new OrderModel(code1);
		model.setPageOn(true);
		model.setPageIndex(orderModel.getPageIndex());
		model.setPageLimit(orderModel.getPageLimit());
		List<OrderModel> list = orderService.getListByuser(model);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", orderService.getcount(model));

		return FormatEmpty.isEmpty(list) ? "" : new JSONObject(map).toString();
	}

}
