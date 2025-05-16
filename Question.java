package JavaStuff;

public class Question {
    private static int count = 0;
    private int id;
    private String customerName;
    private String questionText;
    private String answerText;

    public Question(String customerName, String questionText) {
        this.id = ++count;
        this.customerName = customerName;
        this.questionText = questionText;
        this.answerText = "";
    }

    public int getId() {
        return id;
    }

    public String getCustomerName() {
        return customerName;
    }

    public String getQuestionText() {
        return questionText;
    }

    public String getAnswerText() {
        return answerText;
    }

    public void setAnswerText(String answerText) {
        this.answerText = answerText;
    }
}
