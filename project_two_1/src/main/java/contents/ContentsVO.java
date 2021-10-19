package contents;

import org.springframework.stereotype.Component;

@Component
public class ContentsVO {
	int content_id;
	String content_title;
	String content_quotes;
	String content_name;
	String content_description;
	String content_characters;
	String content_slang;
	String content_slang_desc;
	
	public int getContent_id() {
		return content_id;
	}
	public void setContent_id(int content_id) {
		this.content_id = content_id;
	}
	public String getContent_title() {
		return content_title;
	}
	public void setContent_title(String content_title) {
		this.content_title = content_title;
	}
	public String getContent_quotes() {
		return content_quotes;
	}
	public void setContent_quotes(String content_quotes) {
		this.content_quotes = content_quotes;
	}
	public String getContent_name() {
		return content_name;
	}
	public void setContent_name(String content_name) {
		this.content_name = content_name;
	}
	public String getContent_description() {
		return content_description;
	}
	public void setContent_description(String content_description) {
		this.content_description = content_description;
	}
	public String getContent_characters() {
		return content_characters;
	}
	public void setContent_characters(String content_characters) {
		this.content_characters = content_characters;
	}
	public String getContent_slang() {
		return content_slang;
	}
	public void setContent_slang(String content_slang) {
		this.content_slang = content_slang;
	}
	public String getContent_slang_desc() {
		return content_slang_desc;
	}
	public void setContent_slang_desc(String content_slang_desc) {
		this.content_slang_desc = content_slang_desc;
	}
	@Override
	public String toString() {
		return "ContentVO [content_id=" + content_id + ", content_title=" + content_title + ", content_quotes="
				+ content_quotes + ", content_name=" + content_name + ", content_description=" + content_description
				+ ", content_characters=" + content_characters + ", content_slang=" + content_slang
				+ ", content_slang_desc=" + content_slang_desc + "]";
	}
	
	

}