package com.tms.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "question_papers")
public class QuestionPaper {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "question_id_in_questionpaper")
	private Long questionIdInQuestionPaper;

	@Column(name = "question_id")
	private Long questionId;

	@Column(name = "chapter_name")
	private String chapterName;

	@Column(name = "question")
	private String question;

	@Column(name = "marks")
	private Integer marks;

	@Column(name = "exam_id")
	private Long examId;

	public Long getExamId() {
		return examId;
	}

	public void setExamId(Long examId) {
		this.examId = examId;
	}

	public Long getQuestionId() {
		return questionId;
	}

	public void setQuestionId(Long questionId) {
		this.questionId = questionId;
	}

	public Long getQuestionIdInQuestionPaper() {
		return questionIdInQuestionPaper;
	}

	public void setQuestionIdInQuestionPaper(Long preparedQuestionId) {
		this.questionIdInQuestionPaper = preparedQuestionId;
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

	public void setQuestion(String preparedQuestion) {
		this.question = preparedQuestion;
	}

	public Integer getMarks() {
		return marks;
	}

	public void setMarks(Integer marks) {
		this.marks = marks;
	}

	@Override
	public String toString() {
		return "QuestionPaper [questionIdInQuestionPaper=" + questionIdInQuestionPaper + ", questionId=" + questionId
				+ ", chapterName=" + chapterName + ", question=" + question + ", marks=" + marks
				+ ", examId=" + examId + "]";
	}

}
