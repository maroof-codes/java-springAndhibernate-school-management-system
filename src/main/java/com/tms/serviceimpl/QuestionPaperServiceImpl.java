package com.tms.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tms.beans.QuestionPaperBean;
import com.tms.dao.GenericDao;
import com.tms.entities.Batch;
import com.tms.entities.Exam;
import com.tms.entities.Question;
import com.tms.entities.QuestionPaper;
import com.tms.service.QuestionPaperService;
import com.tms.utils.BeanUtils;

@Service
public class QuestionPaperServiceImpl implements QuestionPaperService {

	@Autowired
	private GenericDao<QuestionPaper> genericPaperDao;

	@Autowired
	private GenericDao<Question> genericDao;

	@Autowired
	private GenericDao<Exam> generic;

	@Override
	public void add(QuestionPaperBean questionPaperBean) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(QuestionPaperBean questionPaperBean) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(String qp_id) {
		genericPaperDao.deleteEntity(Long.valueOf(qp_id), QuestionPaper.class);
	}

	@Override
	public List<QuestionPaperBean> findAll() {
		List<QuestionPaper> questionPaper = genericPaperDao.findAll(QuestionPaper.class);
		return BeanUtils.populateQuestionPaperBeanList(questionPaper);
	}

	@Override
	public QuestionPaperBean findById(String qp_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void findAndAdd(String qp_id, String exam_id) {
		Long questionPaperId = Long.valueOf(qp_id);
		Long examId = Long.valueOf(exam_id);
		Question question = genericDao.findEntityById(Question.class, questionPaperId);
		Exam exam = generic.findEntityById(Exam.class, examId);
		QuestionPaper questionPaper = new QuestionPaper();
		questionPaper.setChapterName(question.getChapterName());
		questionPaper.setExamId(Long.valueOf(exam.getExamId()));
		questionPaper.setMarks(question.getMarks());
		questionPaper.setQuestion(question.getQuestion());
		questionPaper.setQuestionId(question.getQuestionId());
		genericPaperDao.addEntity(questionPaper);
	}
}
