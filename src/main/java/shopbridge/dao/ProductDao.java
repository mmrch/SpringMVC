package shopbridge.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import shopbridge.modal.Product;

@Component
public class ProductDao {
	@Autowired
	private HibernateTemplate hibernateTamplate;

	// create
	@Transactional
	public void createProduct(Product product) {
		this.hibernateTamplate.saveOrUpdate(product);
	}
	

	// get all products
	public List<Product> getProduct() {
		List<Product> products = this.hibernateTamplate.loadAll(Product.class);
		return products;
	}

	// delete the single product
	@Transactional
	public void deleteProduct(int pid) {
		Product p = this.hibernateTamplate.load(Product.class, pid);
		this.hibernateTamplate.delete(p);
	}

	// get the single product
	public Product getProduct(int pid) {
		return this.hibernateTamplate.get(Product.class, pid);
	}
}
