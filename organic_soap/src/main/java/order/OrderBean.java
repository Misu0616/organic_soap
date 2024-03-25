package order;

public class OrderBean {
	/* p_order 컬럼 */
	private int po_key;
	private int po_tot;
	private int po_r_info_key;
	private int po_pay_key;
	private int po_point_key;
	private int po_cart_key;
	  
	/* r_inform 컬럼 */
	private int r_info_key;
	private String r_name;
	private String r_phone;
	private String r_postal_code;
	private String r_address1;
	private String r_address2;
	private String request;
	private int r_mem_key;
	
	/* payment 컬럼 */
	private int pay_key;
	private String pay;
	
	/* points 컬럼 */
	private int point_key;
	private int my_point;
	private int use_point;
	private int get_point;
	private String use_point_date;
	private String get_point_date;
	private int point_mem_key;
	
	
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
	public int getR_info_key() {
		return r_info_key;
	}
	public void setR_info_key(int r_info_key) {
		this.r_info_key = r_info_key;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_phone() {
		return r_phone;
	}
	public void setR_phone(String r_phone) {
		this.r_phone = r_phone;
	}
	public String getR_postal_code() {
		return r_postal_code;
	}
	public void setR_postal_code(String r_postal_code) {
		this.r_postal_code = r_postal_code;
	}
	public String getR_address1() {
		return r_address1;
	}
	public void setR_address1(String r_address1) {
		this.r_address1 = r_address1;
	}
	public String getR_address2() {
		return r_address2;
	}
	public void setR_address2(String r_address2) {
		this.r_address2 = r_address2;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public int getR_mem_key() {
		return r_mem_key;
	}
	public void setR_mem_key(int r_mem_key) {
		this.r_mem_key = r_mem_key;
	}
	public int getPay_key() {
		return pay_key;
	}
	public void setPay_key(int pay_key) {
		this.pay_key = pay_key;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public int getPoint_key() {
		return point_key;
	}
	public void setPoint_key(int point_key) {
		this.point_key = point_key;
	}
	public int getMy_point() {
		return my_point;
	}
	public void setMy_point(int my_point) {
		this.my_point = my_point;
	}
	public int getUse_point() {
		return use_point;
	}
	public void setUse_point(int use_point) {
		this.use_point = use_point;
	}
	public int getGet_point() {
		return get_point;
	}
	public void setGet_point(int get_point) {
		this.get_point = get_point;
	}
	public String getUse_point_date() {
		return use_point_date;
	}
	public void setUse_point_date(String use_point_date) {
		this.use_point_date = use_point_date;
	}
	public String getGet_point_date() {
		return get_point_date;
	}
	public void setGet_point_date(String get_point_date) {
		this.get_point_date = get_point_date;
	}
	public int getPoint_mem_key() {
		return point_mem_key;
	}
	public void setPoint_mem_key(int point_mem_key) {
		this.point_mem_key = point_mem_key;
	}
	
	
	
}
