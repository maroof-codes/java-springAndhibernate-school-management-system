package com.tms.beans;

public class QuestionPaperBean {

	private String questionId;
	
	private String questionIdInQuestionPaper;

	private String chapterName;

	private String preparedQuestion;

	private Integer marks;
	
	private Long examId;

	public String getQuestionId() {
		return questionId;
	}

	public void setQuestionId(String questionId) {
		this.questionId = questionId;
	}

	public String getQuestionIdInQuestionPaper() {
		return questionIdInQuestionPaper;
	}

	public void setQuestionIdInQuestionPaper(String preparedQuestionId) {
		this.questionIdInQuestionPaper = preparedQuestionId;
	}

	public String getChapterName() {
		return chapterName;
	}

	public void setChapterName(String chapterName) {
		this.chapterName = chapterName;
	}

	public String getPreparedQuestion() {
		return preparedQuestion;
	}

	public void setPreparedQuestion(String preparedQuestion) {
		this.preparedQuestion = preparedQuestion;
	}

	public Integer getMarks() {
		return marks;
	}

	public void setMarks(Integer marks) {
		this.marks = marks;
	}

	public Long getExamId() {
		return examId;
	}

	public void setExamId(Long examId) {
		this.examId = examId;
	}

	@Override
	public String toString() {
		return "QuestionPaperBean [questionId=" + questionId + ", questionIdInQuestionPaper=" + questionIdInQuestionPaper
				+ ", chapterName=" + chapterName + ", preparedQuestion=" + preparedQuestion + ", marks=" + marks
				+ ", examId=" + examId + "]";
	}
	


	
}
