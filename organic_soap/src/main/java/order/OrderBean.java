package order;

public class OrderBean {
	/* p_order 컬럼 */
	private int po_key;
	private int po_tot;
	private int po_r_info_key;
	private int po_pay_key;
	private int po_point_key;
	private int po_cart_key;
	
	
	public int getPo_key() {
		return po_key;
	}
	public void setPo_key(int po_key) {
		this.po_key = po_key;
	}
	public int getPo_tot() {
		return po_tot;
	}
	public void setPo_tot(int po_tot) {
		this.po_tot = po_tot;
	}
	public int getPo_r_info_key() {
		return po_r_info_key;
	}
	public void setPo_r_info_key(int po_r_info_key) {
		this.po_r_info_key = po_r_info_key;
	}
	public int getPo_pay_key() {
		return po_pay_key;
	}
	public void setPo_pay_key(int po_pay_key) {
		this.po_pay_key = po_pay_key;
	}
	public int getPo_point_key() {
		return po_point_key;
	}
	public void setPo_point_key(int po_point_key) {
		this.po_point_key = po_point_key;
	}
	public int getPo_cart_key() {
		return po_cart_key;
	}
	public void setPo_cart_key(int po_cart_key) {
		this.po_cart_key = po_cart_key;
	}
	
	
}
