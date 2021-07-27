package com.tms.beans;

public class QuestionBean {

	private Long questionId;

	private String chapterName;

	private String question;

	private Integer marks;

	public Long getQuestionId() {
		return questionId;
	}

	public void setQuestionId(Long questionId) {
		this.questionId = questionId;
	}

	public String getChapterName() {
		return chapterName;
	}

	public void setChapterName(String chapterName) {
		this.chapterName = chapterName;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public Integer getMarks() {
		return marks;
	}

	public void setMarks(Integer marks) {
		this.marks = marks;
	}

	@Override
	public String toString() {
		return "QuestionBean [questionId=" + questionId + ", chapterName=" + chapterName + ", question=" + question
				+ ", marks=" + marks + "]";
	}
    
	 
}
