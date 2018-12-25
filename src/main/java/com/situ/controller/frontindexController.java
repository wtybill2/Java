package com.situ.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.model.CateModel;
import com.situ.model.OrderModel;
import com.situ.model.UserModel;
import com.situ.model.cartModel;
import com.situ.model.productModel;
import com.situ.service.CartService;
import com.situ.service.CateService;
import com.situ.service.OrderService;
import com.situ.service.ProService;
import com.situ.service.UserService;

import st.tool.FormatEmpty;
import st.tool.MD5;

@Controller
@RequestMapping("/frontindex")
public class frontindexController {
	@Autowired
	private CateService cateService;
	@Autowired
	private UserService userService;
	@Autowired
	private CartService cartService;
	@Autowired
	private OrderService orderService;
	
	
	@RequestMapping("/getUserOrderPage")
	public String getUserOrderPage1(HttpSession session,HttpServletRequest request) {
		OrderModel  order=new OrderModel();
		UserModel user = (UserModel) request.getSession().getAttribute("userpom");
		order.setUser(user.getCode());
		order.setOrderby("time DESC ");
		List<OrderModel>list=orderService.getListByorder(order);
		session.setAttribute("order", list);
		OrderModel  order1=new OrderModel();
		List<OrderModel>list1=orderService.selectdao(order1);
		session.setAttribute("order1", list1);
		return "front/order/user_order";
		
	}
	
	
	
	@RequestMapping("/addOrder")
	@ResponseBody
	public String addOrder(String payment,HttpSession session,HttpServletRequest request) {
		int nu=0;
		String num=null; 
		UserModel user = (UserModel) request.getSession().getAttribute("userpom");
		cartModel dd=new cartModel();
		dd.setIschecked("1");
		dd.setUser_id(user.getCode());
		List<cartModel> car=cartService.selectAll(dd);
		
		String code=UUID.randomUUID().toString();
		
		OrderModel  order=new OrderModel();
		String addr="山东省青岛市";				
		String stat="已处理";
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
        String dateNowStr = sdf.format(d);
		
		order.setTime(dateNowStr);
		order.setUser(user.getCode());
		order.setCode(code);
		order.setAddr(addr);
		order.setStatus(stat);
		order.setPricesum(payment);
		String mun=orderService.insertorder(order);
		for(cartModel cart:car) {
		OrderModel  order1=new OrderModel();
		order1.setPro_code(cart.getProduct_id());
		order1.setAmount(cart.getAmount());
		order1.setPrice(cart.getCost());
		order1.setOrder_code(code);
		
		 num=orderService.insert(order1);
		}
		cartModel cart1= new cartModel();
		cart1.setIschecked("1");
		cart1.setUser_id(user.getCode());
		String mm=cartService.deleteModel(cart1);
		nu=Integer.parseInt(num)+Integer.parseInt(mun)+Integer.parseInt(mm);
		
		return nu+"";
	}
	
	@RequestMapping(value = "/getCartPage")
	public String getCartPage(HttpServletRequest request, HttpSession session) {
		
		UserModel user = (UserModel) request.getSession().getAttribute("userpom");
		if (user != null) { // 登陆了从数据库展示

			List<cartModel> carts = cartService.selectByUserId(user.getCode());
			
			session.setAttribute("cartVO",carts);

		}
		return "front/cart/cart";
	}
	
	
	@RequestMapping("/getOrderPage")
	
	private String getOrderPage(Model model,HttpServletRequest request,HttpSession session) {
		UserModel user = (UserModel) request.getSession().getAttribute("userpom");
		if (user != null) { // 登陆了从数据库展示

			List<cartModel> carts = cartService.selectByUserId(user.getCode());
			
			model.addAttribute("cartVO",carts);

		}
		return "front/order/place_order";
		
	}
	
	@RequestMapping("/deleteById")
	@ResponseBody
	private String deleteById(String id) {
		
		return cartService.delete(id)+"";
		
	}
	
	
	@RequestMapping("/addCart")
	@ResponseBody
	public String addCart( String code, String amount,HttpServletRequest request) {
		UserModel user = (UserModel) request.getSession().getAttribute("userpom");
		cartModel cart1 = new cartModel();
		cart1.setProduct_id(code);
		cart1.setUser_id(user.getCode());
		List<cartModel> list=cartService.selectAll(cart1);
		
		if(!FormatEmpty.isEmpty(list)) {
			int sum=Integer.parseInt(list.get(0).getAmount());
			int sum2=Integer.parseInt(amount);
			cartModel cart = new cartModel();
			cart.setId(list.get(0).getId());
			cart.setAmount((sum+sum2)+"");
			return cartService.updateActive(cart)+"";
		}
		String ischecked = "0";
		cartModel cart = new cartModel(user.getCode(), code, amount, ischecked);
		return cartService.insert(cart) + "";
	}

	@RequestMapping("/UpdateCart1")
	@ResponseBody
	public String UpdateCart1(String productId, String ischecked) {

		cartModel cart1 = new cartModel();
		cart1.setId(Integer.parseInt(productId));
		cart1.setIschecked(ischecked);
		return cartService.updateActive(cart1) + "";
	}

	@RequestMapping("/UpdateCart")
	@ResponseBody
	public String UpdateCart(final String[] id,String isChecked) {
		
		int a = 0;
		
		for (String s : id) {
			cartModel cart = new cartModel();
			cart.setId(Integer.parseInt(s));
			cart.setIschecked(isChecked);
			a += cartService.updateActive(cart);
			
			
		}
		
		return a + "";

	}

	@RequestMapping("/sum")
	@ResponseBody
	public String sum(String id, String sum, HttpServletRequest request) {

		cartModel cart = new cartModel();
		cart.setId(Integer.parseInt(id));
		cart.setAmount(sum);
		request.setAttribute("cart1", cart);
		return cartService.update(cart) + "";
	}

	@RequestMapping("/index")
	public String index(Model model) {
		List<CateModel> topCategoryList = cateService.selectTop();
		model.addAttribute("topCategoryList", topCategoryList);
		// String code=topCategoryList.get(0).getCode();
		List<CateModel> secondCategoryList = cateService.selectsecond();
		model.addAttribute("secondCategoryList", secondCategoryList);

		return "front/index";
	}

	@RequestMapping(value = "/getLoginPage")
	public String getUserPage() {
		return "front/user/login";
	}

	@RequestMapping(value = "/loginfront")
	@ResponseBody
	private String login(String username, String password, HttpServletRequest request) {
		String pass1 = MD5.encode(password);
		String code = username;

		UserModel ModelDB = userService.getUserByCode(code);
		if(ModelDB==null) {
			return "0";
		}else if (ModelDB.getRole().equals("putong") && ModelDB.getPass().equals(pass1)) {
			request.getSession().setAttribute("userpom", ModelDB);
			return "1";
		} else {
			return "0";
		}  
	}

	@RequestMapping("/loginOut")
	public void loginOut(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.getSession().setAttribute("userpom", null);

		response.sendRedirect("/Java/frontindex/index.action");
		
	}

	@Autowired
	private ProService productService;

	// 商品展示页面
	@RequestMapping(value = "/getProductListPage")
	public String getProductListPage(String code, Model model,HttpServletRequest request) {
		String pageIndex=request.getParameter("pageIndex");
		String pageLimit=request.getParameter("pageLimit");
		
		productModel mod = new productModel();
		mod.setProduct_type(code);
		mod.setPageOn(true);
		mod.setPageIndex(Integer.parseInt(pageIndex));
		mod.setPageLimit(Integer.parseInt(pageLimit));
		
		List<productModel> productList = productService.getListByuser(mod);
		model.addAttribute("productList", productList);
		return "front/product/product_list";
	}
	@RequestMapping(value = "/getProductListPage1")
	public String getProductListPage1(String name,String pageIndex,String pageLimit, Model model) {
		productModel mod = new productModel();
		String code1="%"+name+"%";
		mod.setName(code1);
		mod.setPageOn(true);
		mod.setPageIndex(Integer.parseInt(pageIndex));
		mod.setPageLimit(Integer.parseInt(pageLimit));
		List<productModel> productList = productService.getListByuser(mod);
		model.addAttribute("productList", productList);
		return "front/product/product_list";
	}

	// 商品数量
	@RequestMapping(value = "/getCount")
	@ResponseBody
	public int getProductListPage2(String code, String pageIndex, String pageLimit) {
		productModel mod = new productModel();
		    if(code!="") {
		    	mod.setProduct_type(code);
		    	mod.setPageOn(true);
		    	mod.setPageIndex(Integer.parseInt(pageIndex));
		    	mod.setPageLimit(Integer.parseInt(pageLimit));
		    	
		    }else {
		    	mod.setPageOn(true);
		    	mod.setPageIndex(Integer.parseInt(pageIndex));
		    	mod.setPageLimit(Integer.parseInt(pageLimit));
		    }
		    
		
		
		int count = productService.getCount(mod);

		return count;

	}

	// 商品详情页
	@RequestMapping(value = "/getProductDetailPage")
	public String getProductDetailPage(String id, Model model) {
		productModel product = productService.select(id);
		model.addAttribute("product", product);
		return "front/product/product_detail";
	}
	
}
