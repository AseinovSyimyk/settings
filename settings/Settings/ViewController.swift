import UIKit

class ViewController: UITableViewController {
    
    var settingsData: [Settings] = [
        Settings(title: "Темная тема", type: .none),
        Settings(title: "Выбрать язык", type: .configure)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let setting = settingsData[indexPath.row]
        
        cell.textLabel?.text = setting.title
        
        if setting.type == .none {
            
            let switchView = UISwitch()
            
            
            switchView.isOn = UserDefaults.standard.bool(forKey: "Темноя тема")
            
            switchView.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
            cell.accessoryView = switchView
        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let setting = settingsData[indexPath.row]
        
        if setting.type == .configure {
            
            let languageSelectionVC = LanguageSelectionViewController()
            navigationController?.pushViewController(languageSelectionVC, animated: true)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    @objc func switchChanged(_ sender: UISwitch) {
        
        if sender.isOn {
            
            print("Темная тема включена")
        } else {
            
            print("Темная тема выключена")
        }
    }
}
