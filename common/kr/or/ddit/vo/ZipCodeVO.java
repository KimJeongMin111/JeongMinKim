package kr.or.ddit.vo;

public class ZipCodeVO {
	
	/*
	 * Bean : 데이터 저장 객체(private 전역변수, setter/getter 선언)
	 *  |    DTO,VO는 Bean으로부터 파생
	 *  +--DTO : 데이터 저장 객체(CS(Client Server)통신 환경에서 직렬화된 전송 객체) - 수정 불가능
	 *  +--VO : 데이터 저장 객체(Service내 활용) - 수정 가능
	 * 
	 */
	
	private String zipcode;
	private String sido;
	private String gugun;
	private String dong;
	private String bunji;
	private String seq;
	
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getBunji() {
		return bunji;
	}
	public void setBunji(String bunji) {
		this.bunji = bunji;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	
}
