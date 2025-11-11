import UIKit



class AboutCompanyVC: UIViewController {
    var aboutCompanyText = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(.white)
        aboutCompanyText.text = "Наша компания самая лучшая!"
        
        aboutCompanyText.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(aboutCompanyText)
        NSLayoutConstraint.activate([
            aboutCompanyText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            aboutCompanyText.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            ])
    }
}
