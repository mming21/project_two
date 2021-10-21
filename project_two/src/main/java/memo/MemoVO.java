package memo;

import org.springframework.stereotype.Component;

@Component
public class MemoVO {
	
	String id;
	String num;
	String memo_contents1;
	String memo_contents2;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getMemo_contents1() {
		return memo_contents1;
	}
	public void setMemo_contents1(String memo_contents1) {
		this.memo_contents1 = memo_contents1;
	}
	public String getMemo_contents2() {
		return memo_contents2;
	}
	public void setMemo_contents2(String memo_contents2) {
		this.memo_contents2 = memo_contents2;
	}	
	
	
}
