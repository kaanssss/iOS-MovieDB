//
//  MoviesViewController.swift
//  MovieDb1
//
//  Created by Kaan Yalçınkaya on 7.01.2022.
//

import UIKit
import Alamofire
import Kingfisher

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var movies: [NSDictionary]?
    var movieList = [Result] ()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        fetchMovies()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let movie = movieList[indexPath.row]
        let title = movie.title
        let overview = movie.overview
        let posterPath = movie.posterPath!
        
        let baseUrl = "https://image.tmdb.org/t/p/w500"
        let imageUrl = baseUrl + posterPath
        
        
        cell.titleLabel.text = title
        cell.overViewLabel.text = overview
        cell.posterView.kf.setImage(with: URL(string: imageUrl), placeholder: nil, options: [.transition(.fade(0.7))], completionHandler: nil)
        
        
        return cell
    }
    
    
    func fetchMovies(){
        
        AF.request("https://api.themoviedb.org/3/movie/now_playing?api_key=4512342b9b7345d1939f6b43100258cd", method: .get).responseJSON { response in
            if let data = response.data{
                do{
                    let cevap =  try JSONDecoder().decode(Artist.self, from: data)
                    if let gelenData = cevap.results{
                        self.movieList = gelenData
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        
                        
                        
                        
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //func fetchMovies() {
    //        let apiKey = "4512342b9b7345d1939f6b43100258cd"
    //        let url = NSURL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)")
    //        let request = NSURLRequest(url: url as! URL, cachePolicy: NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData, timeoutInterval: 10)
    //
    //        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue.main)
    //
    //        let task: URLSessionDataTask = session.dataTask(with: request as URLRequest,
    //                                                        completionHandler: {(dataOrNil, response, error) in
    //            if let data = dataOrNil{
    //                if let responseDictionary = try! JSONSerialization.jsonObject(with: data,options:[]) as? [Result] {
    //                    print("response: \(responseDictionary)")
    //
    //                    self.movieList = responseDictionary
    //
    //
    //                    self.tableView.reloadData()
    //                }
    //
    //            }
    //        })
    //        task.resume()
    //    }
}



