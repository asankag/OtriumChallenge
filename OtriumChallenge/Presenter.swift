//
//  Presenter.swift
//  OtriumChallenge
//
//  Created by Asanka Gankewala on 3/28/21.
//

import Foundation
import Apollo

protocol PresenterView: class {
    func updateProfile(data: UserModel)
    func showAlertMessage(_ message: String)
}

class Presenter {
    weak var view: PresenterView?
    
    var userModel: UserModel?

    init(with view: PresenterView) {
        self.view = view
    }
    
    func updateData() {
        loadUserData("fabpot")
        //save as Date
        UserDefaults.standard.set(Date(), forKey: "lastsavedate")
    }
    
    func loadUserData (_ login: String) {
        
        Network.shared.apollo.fetch(query: UserProfileQuery(login: login), cachePolicy: .fetchIgnoringCacheData){[weak self] result in
            switch result {
            
            case .success(let graphQLResult):
                self?.successUserQuery(graphQLResult)
                break
            case .failure(let error):
                self?.errorQuery(error.localizedDescription)
                break
            }
        }
    }
    
    private func successUserQuery(_ results: GraphQLResult<UserProfileQuery.Data>) {
        if let items = results.data?.user {
            let json = items.jsonObject
            let myData = try! JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
            let userValueData = try? JSONDecoder().decode(UserModel.self, from: myData)
            DispatchQueue.main.async {
                self.userModel = userValueData
                if let userModel = self.userModel {
                    self.view?.updateProfile(data: userModel)
                }else{
                    self.errorQuery("Please try again")
                }
            }
        }else {
            self.errorQuery("No profile")
        }
    }
    private func errorQuery(_ error: String) {
        self.view?.showAlertMessage(error)
    }
}
