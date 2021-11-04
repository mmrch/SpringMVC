package shopbridge.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;

import shopbridge.dao.ProductDao;
import shopbridge.modal.Product;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


@Controller
public class MainController {
	
	@Autowired
	private ProductDao productDao;
	
	@RequestMapping("/")
	public String home(Model view) {
		List<Product> products=productDao.getProduct();
		view.addAttribute("product",products);
		return "index";
	}
	
	@RequestMapping("/exception/{msg}")
	public String addExecption(@PathVariable("msg") String msg, Model page) {
		page.addAttribute("exception_message" ,msg);
		return "exception";
	}
	
	@RequestMapping(value="/adding-product" , method =RequestMethod.POST )
	public RedirectView handleProduct(@ModelAttribute Product product , HttpServletRequest request) {
		productDao.createProduct(product);
		RedirectView redirectView=new RedirectView();
		redirectView.setUrl(request.getContextPath()+"/");
		return redirectView; 
	}
	@RequestMapping("/delete/{prdId}")
	@ResponseBody
	public void deleteProduct(@PathVariable("prdId") int productId, HttpServletRequest request) {
		System.out.println("deleting....");
		productDao.deleteProduct(productId); 
	}
	
	@RequestMapping("/update/{prdId}")
	@ResponseBody
	public String updateProduct(@PathVariable("prdId") int productId, HttpServletRequest request , Model page) {
		System.out.println("updating....");
		Product product=productDao.getProduct(productId);
		
		JSONObject jsonObject=new JSONObject();
		try {
			jsonObject.put("id", product.getId());
			jsonObject.put("name", product.getName());
			jsonObject.put("description", product.getDescription());
			jsonObject.put("price", product.getPrice());
			jsonObject.put("stock", product.getStock());
		}catch(JSONException e){
			
		}
		return jsonObject.toString();
	}
	
}
