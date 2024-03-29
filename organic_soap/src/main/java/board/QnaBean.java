package board;

public class QnaBean {
	
	private int qna_key;
	private String qna_subject;
	private String qna_content;
	private String qna_date;
	private String qna_pass;
	private String qna_file_name;
	private int qna_mem_key;
	private String mem_name;
	private String mem_level;
	
	
	public String getMem_level() {
		return mem_level;
	}
	public void setMem_level(String mem_level) {
		this.mem_level = mem_level;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	private int reply_key;
	private String reply_content;
	private String reply_date;
	private String reply_file_name;
	private String reply_write;
	private int reply_qna_key;
	
	
	public int getQna_key() {
		return qna_key;
	}
	public void setQna_key(int qna_key) {
		this.qna_key = qna_key;
	}
	public String getQna_subject() {
		return qna_subject;
	}
	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_date() {
		return qna_date;
	}
	public void setQna_date(String qna_date) {
		this.qna_date = qna_date;
	}
	public String getQna_pass() {
		return qna_pass;
	}
	public void setQna_pass(String qna_pass) {
		this.qna_pass = qna_pass;
	}
	public String getQna_file_name() {
		return qna_file_name;
	}
	public void setQna_file_name(String qna_file_name) {
		this.qna_file_name = qna_file_name;
	}
	public int getQna_mem_key() {
		return qna_mem_key;
	}
	public void setQna_mem_key(int qna_mem_key) {
		this.qna_mem_key = qna_mem_key;
	}
	public int getReply_key() {
		return reply_key;
	}
	public void setReply_key(int reply_key) {
		this.reply_key = reply_key;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_date() {
		return reply_date;
	}
	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}
	public String getReply_file_name() {
		return reply_file_name;
	}
	public void setReply_file_name(String reply_file_name) {
		this.reply_file_name = reply_file_name;
	}
	public String getReply_write() {
		return reply_write;
	}
	public void setReply_write(String reply_write) {
		this.reply_write = reply_write;
	}
	public int getReply_qna_key() {
		return reply_qna_key;
	}
	public void setReply_qna_key(int reply_qna_key) {
		this.reply_qna_key = reply_qna_key;
	}
	
	
	
	
}
