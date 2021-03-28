//
//  Network.swift
//  OtriumChallenge
//
//  Created by Asanka Gankewala on 3/28/21.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    
    private(set) lazy var apollo: ApolloClient = {
        // The cache is necessary to set up the store, which we're going to hand to the provider
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        
        let client = URLSessionClient()
        let provider = NetworkInterceptorProvider(store: store, client: client)
        let url = URL(string: "https://api.github.com/graphql")!
        let token = "445f63d512865bcf6ebe576574cfb5d7c973c018"
        let header = ["Authorization": "Bearer \(token)"]
        
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                                 endpointURL: url, additionalHeaders: header)
        
        // Remember to give the store you already created to the client so it
        // doesn't create one on its own
        return ApolloClient(networkTransport: requestChainTransport,
                            store: store)
    }()
}

struct NetworkInterceptorProvider: InterceptorProvider {
    
    // These properties will remain the same throughout the life of the `InterceptorProvider`, even though they
    // will be handed to different interceptors.
    private let store: ApolloStore
    private let client: URLSessionClient
    
    init(store: ApolloStore,
         client: URLSessionClient) {
        self.store = store
        self.client = client
    }
    
    func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        return [
            MaxRetryInterceptor(),
            LegacyCacheReadInterceptor(store: self.store),
            NetworkFetchInterceptor(client: self.client),
            ResponseCodeInterceptor(),
            LegacyParsingInterceptor(cacheKeyForObject: self.store.cacheKeyForObject),
            AutomaticPersistedQueryInterceptor(),
            LegacyCacheWriteInterceptor(store: self.store)
        ]
    }
}

