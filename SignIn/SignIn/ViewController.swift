import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var button: UIButton!
    
    let signIn = ["User1": "Password1", "User2": "Password2", "User3": "Password3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = 10
    }
    
    @IBAction func signInButton(_ sender: UIButton) {
        for i in signIn {
            if i.key == loginTextField.text! && i.value == passwordTextField.text! {
                performSegue(withIdentifier: "enjoy", sender: nil)
            }
        }
        showAlert(title: "Ошибка", message: "Введены неверные данные")
    }
    
    @IBAction func forgotLoginOrPassword(_ sender: UIButton) {
        if sender.tag == 0 {
            showAlert(title: "Логин", message: "Вы можете использовать один из данных логинов: \(signIn.keys.formatted())")
        } else if sender.tag == 1 {
            showAlert(title: "Пароль", message: "Вы можете использовать один из данных паролей: \(signIn.values.formatted())")
        }
    }
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "enjoy" else { return }
        guard let destination = segue.destination as? SecondViewController else { return }
        destination.text = "Добро пожаловать \(loginTextField.text!)!  "
    }
    
    @IBAction func backButtonPressed(_ sender: UIStoryboardSegue) {}
}

extension ViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.loginTextField.text = ""
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
