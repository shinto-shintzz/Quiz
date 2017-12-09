
import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let allQuestions =  QuestionBank()
    var pickedAns :Bool = false
    var QuestionNumber :Int = 0
    var score : Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startOver()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1{
            pickedAns = true
        }
        else if sender.tag == 2{
            pickedAns = false
        }
        
        checkAnswer()
        QuestionNumber += 1
        
        nextQuestion()
  
    }
    
    
    func updateUI() {
      
        scoreLabel.text = String(score)
        progressLabel.text = "\(QuestionNumber+1)/13"
        progressBar.frame.size.width = (view.frame.size.width/13) * CGFloat(QuestionNumber+1)
    }
    

    func nextQuestion() {
        
        if QuestionNumber <= 12
        {
            questionLabel.text = allQuestions.list[QuestionNumber].questionText
        }
        else{
            print("End Of Quiz")
            
            let alert = UIAlertController(title: "Awsome", message: "Do you want to Start Over", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                
                self.startOver()
            })
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
            
            //QuestionNumber = 0
        }
        
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[QuestionNumber].answer
        if correctAnswer == pickedAns{
            print("Correct")
            score = score + 1
            
        }
        else{
            print("gone")
            score = score - 1
            
        }
        updateUI()
        
    }
    
    
    func startOver() {
        score = 0
        scoreLabel.text = String(score)
        QuestionNumber = 0
        let firstQuestion = allQuestions.list[QuestionNumber]
        questionLabel.text = firstQuestion.questionText
        updateUI()
    }
    

    
}
