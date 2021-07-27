package com.tms.serviceimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tms.beans.ExamBean;
import com.tms.beans.QuestionBean;
import com.tms.dao.GenericDao;
import com.tms.entities.Question;
import com.tms.service.QuestionService;
import com.tms.utils.BeanUtils;
import com.tms.utils.ExcelUtils;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private GenericDao<Question> genericDao;

	@Override
	public void readDataFromExcelSheet(String filePath) {
		List<QuestionBean> questionBeans = ExcelUtils.extractAsList(filePath);
		// System.out.println("QuestionBeans : "+questionBeans);
		if (questionBeans != null) {
			for (QuestionBean questionBean : questionBeans) {
				System.err.println("question Bean" + questionBean);
				Question question = new Question();
				question.setChapterName(questionBean.getChapterName());
				question.setQuestion(questionBean.getQuestion());
				question.setQuestionId(questionBean.getQuestionId());
				question.setMarks(questionBean.getMarks());
				genericDao.addEntity(question);
			}
		}
	}

	@Override
	public void update(QuestionBean questionBean) {
		Question question = BeanUtils.populateQuestion(questionBean);
		genericDao.updateEntity(question);
	}

	@Override
	public void delete(String questionId) {

	}

	@Override
	public List<QuestionBean> findAll() {
		List<Question> questions = genericDao.findAll(Question.class);
		List<QuestionBean> questionbeans = new ArrayList<QuestionBean>();
		
		if(questions != null){
			for(Question question : questions){
			QuestionBean questionBean = new QuestionBean();
			questionBean.setChapterName(question.getChapterName());
			questionBean.setMarks(question.getMarks());
			questionBean.setQuestion(question.getQuestion());
			questionBean.setQuestionId(question.getQuestionId());
			questionbeans.add(questionBean);
		}
		}
		return questionbeans;
	}

	@Override
	public ExamBean findById(String questionId) {
		// TODO Auto-generated method stub
		return null;
	}

}
