//
//  FavoritosViewController.swift
//  GoCoffee2
//
//  Created by Admin on 04/10/22.
//

import UIKit

class FavoritosViewController: UIViewController {
    @IBOutlet weak var favoritostableview: UITableView!
    
    
    private var favoriteShops: [CoffeeModel] = [
        CoffeeModel(title: "The Coffee", description: "The best of brazilian coffee combined with the purity and perfectionism of Japan.", image: "thecoffee"),
        CoffeeModel(title: "Le Pain Le Café", description: "The best of brazilian coffee combined with the purity and perfectionism of Japan.", image: "lepainlecafe")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        favoritostableview.delegate = self
        favoritostableview.dataSource = self
    }
    

}


extension FavoritosViewController: UITableViewDataSource, UITableViewDelegate {
    
    //Função da tableview para definir quantas linhas por sessão teremos. Nesse caso estamos retornando o número de cafeterias no nosso array coffeShops.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoriteShops.count
    }
    
    //Função da tablview que configura a celula por linha. Como criamos uma celula pelo storyboard demos o nome dela de coffeeCell, podemos usar ela aqui e fazer as configurações. Essa funções executa para cada celula da tableview.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favoritostableview.dequeueReusableCell(withIdentifier: "coffeeCell", for: indexPath) as! CoffeeTableViewCell
        
        // Altera a cor de fundo para branco quando seleciona a celula
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.white
        cell.selectedBackgroundView = backgroundView
        
        let coffee = favoriteShops[indexPath.row]
        cell.titleCoffee.text = coffee.title
        cell.descriptionCoffee.text = coffee.description
        cell.imageCoffee.image = UIImage(named: coffee.image)
        return cell
    }
    
    //Função da tableview que é executada quando uma celula é selecionada. Aqui fazemos a navegação para a tela de detalhes usando a segue manual que criamos no storyboard. Passando o item que foi clicado para a próxima tela.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetailCoffee", sender: favoriteShops[indexPath.row])
    }
    
    //Função que é executada toda vez quando acontece uma navegação por segue. Aqui identificamos se é segue de detalhes e então dizemos que a variável da tela que vamos abrir é igual ao item que foi clicado. Para podemos usar os dados na próxima tela.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)  {
      if segue.identifier == "showDetailCoffee",
         let detailVC = segue.destination as? DetailCoffeViewController {
          detailVC.coffee = sender as? CoffeeModel
      }
    }
}
