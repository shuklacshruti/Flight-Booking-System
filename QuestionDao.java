package JavaStuff;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class QuestionDao {
    private List<Question> questions = new ArrayList<>();

    public void postQuestion(String customerName, String questionText) {
        questions.add(new Question(customerName, questionText));
    }

    public List<Question> getAllQuestions() {
        return questions;
    }

    public List<Question> searchQuestions(String keyword) {
        return questions.stream()
                .filter(q -> q.getQuestionText().toLowerCase().contains(keyword.toLowerCase()))
                .collect(Collectors.toList());
    }

    public void answerQuestion(int questionId, String answerText) {
        for (Question q : questions) {
            if (q.getId() == questionId) {
                q.setAnswerText(answerText);
                break;
            }
        }
    }
} 

