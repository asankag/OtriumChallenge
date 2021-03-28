// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class UserProfileQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query UserProfile($login: String!) {
      user(login: $login) {
        __typename
        name
        login
        avatarUrl
        anyPinnableItems
        email
        followers {
          __typename
          totalCount
        }
        following {
          __typename
          totalCount
        }
        pinnedItems(first: 3) {
          __typename
          edges {
            __typename
            node {
              __typename
              ... on Repository {
                name
                description
                primaryLanguage {
                  __typename
                  name
                }
                forkCount
                openGraphImageUrl
                projects {
                  __typename
                  totalCount
                }
              }
            }
          }
        }
        topRepositories(first: 10, orderBy: {field: STARGAZERS, direction: DESC}) {
          __typename
          totalCount
          nodes {
            __typename
            name
            description
            primaryLanguage {
              __typename
              name
            }
            forkCount
            openGraphImageUrl
            projects {
              __typename
              totalCount
            }
          }
        }
        starredRepositories(first: 10) {
          __typename
          totalCount
          nodes {
            __typename
            name
            description
            primaryLanguage {
              __typename
              name
            }
            forkCount
            openGraphImageUrl
            projects {
              __typename
              totalCount
            }
          }
        }
      }
    }
    """

  public let operationName: String = "UserProfile"

  public var login: String

  public init(login: String) {
    self.login = login
  }

  public var variables: GraphQLMap? {
    return ["login": login]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("user", arguments: ["login": GraphQLVariable("login")], type: .object(User.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: User? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
    }

    /// Lookup a user by login.
    public var user: User? {
      get {
        return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "user")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("login", type: .nonNull(.scalar(String.self))),
          GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
          GraphQLField("anyPinnableItems", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("followers", type: .nonNull(.object(Follower.selections))),
          GraphQLField("following", type: .nonNull(.object(Following.selections))),
          GraphQLField("pinnedItems", arguments: ["first": 3], type: .nonNull(.object(PinnedItem.selections))),
          GraphQLField("topRepositories", arguments: ["first": 10, "orderBy": ["field": "STARGAZERS", "direction": "DESC"]], type: .nonNull(.object(TopRepository.selections))),
          GraphQLField("starredRepositories", arguments: ["first": 10], type: .nonNull(.object(StarredRepository.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String? = nil, login: String, avatarUrl: String, anyPinnableItems: Bool, email: String, followers: Follower, following: Following, pinnedItems: PinnedItem, topRepositories: TopRepository, starredRepositories: StarredRepository) {
        self.init(unsafeResultMap: ["__typename": "User", "name": name, "login": login, "avatarUrl": avatarUrl, "anyPinnableItems": anyPinnableItems, "email": email, "followers": followers.resultMap, "following": following.resultMap, "pinnedItems": pinnedItems.resultMap, "topRepositories": topRepositories.resultMap, "starredRepositories": starredRepositories.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The user's public profile name.
      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// The username used to login.
      public var login: String {
        get {
          return resultMap["login"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "login")
        }
      }

      /// A URL pointing to the user's public avatar.
      public var avatarUrl: String {
        get {
          return resultMap["avatarUrl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "avatarUrl")
        }
      }

      /// Determine if this repository owner has any items that can be pinned to their profile.
      public var anyPinnableItems: Bool {
        get {
          return resultMap["anyPinnableItems"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "anyPinnableItems")
        }
      }

      /// The user's publicly visible profile email.
      public var email: String {
        get {
          return resultMap["email"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      /// A list of users the given user is followed by.
      public var followers: Follower {
        get {
          return Follower(unsafeResultMap: resultMap["followers"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "followers")
        }
      }

      /// A list of users the given user is following.
      public var following: Following {
        get {
          return Following(unsafeResultMap: resultMap["following"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "following")
        }
      }

      /// A list of repositories and gists this profile owner has pinned to their profile
      public var pinnedItems: PinnedItem {
        get {
          return PinnedItem(unsafeResultMap: resultMap["pinnedItems"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pinnedItems")
        }
      }

      /// Repositories the user has contributed to, ordered by contribution rank, plus repositories the user has created
      public var topRepositories: TopRepository {
        get {
          return TopRepository(unsafeResultMap: resultMap["topRepositories"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "topRepositories")
        }
      }

      /// Repositories the user has starred.
      public var starredRepositories: StarredRepository {
        get {
          return StarredRepository(unsafeResultMap: resultMap["starredRepositories"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "starredRepositories")
        }
      }

      public struct Follower: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FollowerConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(totalCount: Int) {
          self.init(unsafeResultMap: ["__typename": "FollowerConnection", "totalCount": totalCount])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Identifies the total count of items in the connection.
        public var totalCount: Int {
          get {
            return resultMap["totalCount"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalCount")
          }
        }
      }

      public struct Following: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FollowingConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(totalCount: Int) {
          self.init(unsafeResultMap: ["__typename": "FollowingConnection", "totalCount": totalCount])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Identifies the total count of items in the connection.
        public var totalCount: Int {
          get {
            return resultMap["totalCount"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalCount")
          }
        }
      }

      public struct PinnedItem: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PinnableItemConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("edges", type: .list(.object(Edge.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(edges: [Edge?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "PinnableItemConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of edges.
        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PinnableItemEdge"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("node", type: .object(Node.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(node: Node? = nil) {
            self.init(unsafeResultMap: ["__typename": "PinnableItemEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The item at the end of the edge.
          public var node: Node? {
            get {
              return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "node")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Gist", "Repository"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLTypeCase(
                  variants: ["Repository": AsRepository.selections],
                  default: [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  ]
                )
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public static func makeGist() -> Node {
              return Node(unsafeResultMap: ["__typename": "Gist"])
            }

            public static func makeRepository(name: String, description: String? = nil, primaryLanguage: AsRepository.PrimaryLanguage? = nil, forkCount: Int, openGraphImageUrl: String, projects: AsRepository.Project) -> Node {
              return Node(unsafeResultMap: ["__typename": "Repository", "name": name, "description": description, "primaryLanguage": primaryLanguage.flatMap { (value: AsRepository.PrimaryLanguage) -> ResultMap in value.resultMap }, "forkCount": forkCount, "openGraphImageUrl": openGraphImageUrl, "projects": projects.resultMap])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var asRepository: AsRepository? {
              get {
                if !AsRepository.possibleTypes.contains(__typename) { return nil }
                return AsRepository(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsRepository: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Repository"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("name", type: .nonNull(.scalar(String.self))),
                  GraphQLField("description", type: .scalar(String.self)),
                  GraphQLField("primaryLanguage", type: .object(PrimaryLanguage.selections)),
                  GraphQLField("forkCount", type: .nonNull(.scalar(Int.self))),
                  GraphQLField("openGraphImageUrl", type: .nonNull(.scalar(String.self))),
                  GraphQLField("projects", type: .nonNull(.object(Project.selections))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(name: String, description: String? = nil, primaryLanguage: PrimaryLanguage? = nil, forkCount: Int, openGraphImageUrl: String, projects: Project) {
                self.init(unsafeResultMap: ["__typename": "Repository", "name": name, "description": description, "primaryLanguage": primaryLanguage.flatMap { (value: PrimaryLanguage) -> ResultMap in value.resultMap }, "forkCount": forkCount, "openGraphImageUrl": openGraphImageUrl, "projects": projects.resultMap])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The name of the repository.
              public var name: String {
                get {
                  return resultMap["name"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "name")
                }
              }

              /// The description of the repository.
              public var description: String? {
                get {
                  return resultMap["description"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "description")
                }
              }

              /// The primary language of the repository's code.
              public var primaryLanguage: PrimaryLanguage? {
                get {
                  return (resultMap["primaryLanguage"] as? ResultMap).flatMap { PrimaryLanguage(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "primaryLanguage")
                }
              }

              /// Returns how many forks there are of this repository in the whole network.
              public var forkCount: Int {
                get {
                  return resultMap["forkCount"]! as! Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "forkCount")
                }
              }

              /// The image used to represent this repository in Open Graph data.
              public var openGraphImageUrl: String {
                get {
                  return resultMap["openGraphImageUrl"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "openGraphImageUrl")
                }
              }

              /// A list of projects under the owner.
              public var projects: Project {
                get {
                  return Project(unsafeResultMap: resultMap["projects"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "projects")
                }
              }

              public struct PrimaryLanguage: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Language"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("name", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(name: String) {
                  self.init(unsafeResultMap: ["__typename": "Language", "name": name])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The name of the current language.
                public var name: String {
                  get {
                    return resultMap["name"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "name")
                  }
                }
              }

              public struct Project: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["ProjectConnection"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(totalCount: Int) {
                  self.init(unsafeResultMap: ["__typename": "ProjectConnection", "totalCount": totalCount])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// Identifies the total count of items in the connection.
                public var totalCount: Int {
                  get {
                    return resultMap["totalCount"]! as! Int
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "totalCount")
                  }
                }
              }
            }
          }
        }
      }

      public struct TopRepository: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["RepositoryConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
            GraphQLField("nodes", type: .list(.object(Node.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(totalCount: Int, nodes: [Node?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "RepositoryConnection", "totalCount": totalCount, "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Identifies the total count of items in the connection.
        public var totalCount: Int {
          get {
            return resultMap["totalCount"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalCount")
          }
        }

        /// A list of nodes.
        public var nodes: [Node?]? {
          get {
            return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Repository"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("description", type: .scalar(String.self)),
              GraphQLField("primaryLanguage", type: .object(PrimaryLanguage.selections)),
              GraphQLField("forkCount", type: .nonNull(.scalar(Int.self))),
              GraphQLField("openGraphImageUrl", type: .nonNull(.scalar(String.self))),
              GraphQLField("projects", type: .nonNull(.object(Project.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String, description: String? = nil, primaryLanguage: PrimaryLanguage? = nil, forkCount: Int, openGraphImageUrl: String, projects: Project) {
            self.init(unsafeResultMap: ["__typename": "Repository", "name": name, "description": description, "primaryLanguage": primaryLanguage.flatMap { (value: PrimaryLanguage) -> ResultMap in value.resultMap }, "forkCount": forkCount, "openGraphImageUrl": openGraphImageUrl, "projects": projects.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The name of the repository.
          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// The description of the repository.
          public var description: String? {
            get {
              return resultMap["description"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "description")
            }
          }

          /// The primary language of the repository's code.
          public var primaryLanguage: PrimaryLanguage? {
            get {
              return (resultMap["primaryLanguage"] as? ResultMap).flatMap { PrimaryLanguage(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "primaryLanguage")
            }
          }

          /// Returns how many forks there are of this repository in the whole network.
          public var forkCount: Int {
            get {
              return resultMap["forkCount"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "forkCount")
            }
          }

          /// The image used to represent this repository in Open Graph data.
          public var openGraphImageUrl: String {
            get {
              return resultMap["openGraphImageUrl"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "openGraphImageUrl")
            }
          }

          /// A list of projects under the owner.
          public var projects: Project {
            get {
              return Project(unsafeResultMap: resultMap["projects"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "projects")
            }
          }

          public struct PrimaryLanguage: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Language"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String) {
              self.init(unsafeResultMap: ["__typename": "Language", "name": name])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The name of the current language.
            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }
          }

          public struct Project: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["ProjectConnection"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(totalCount: Int) {
              self.init(unsafeResultMap: ["__typename": "ProjectConnection", "totalCount": totalCount])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Identifies the total count of items in the connection.
            public var totalCount: Int {
              get {
                return resultMap["totalCount"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "totalCount")
              }
            }
          }
        }
      }

      public struct StarredRepository: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["StarredRepositoryConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
            GraphQLField("nodes", type: .list(.object(Node.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(totalCount: Int, nodes: [Node?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "StarredRepositoryConnection", "totalCount": totalCount, "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Identifies the total count of items in the connection.
        public var totalCount: Int {
          get {
            return resultMap["totalCount"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalCount")
          }
        }

        /// A list of nodes.
        public var nodes: [Node?]? {
          get {
            return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Repository"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("description", type: .scalar(String.self)),
              GraphQLField("primaryLanguage", type: .object(PrimaryLanguage.selections)),
              GraphQLField("forkCount", type: .nonNull(.scalar(Int.self))),
              GraphQLField("openGraphImageUrl", type: .nonNull(.scalar(String.self))),
              GraphQLField("projects", type: .nonNull(.object(Project.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String, description: String? = nil, primaryLanguage: PrimaryLanguage? = nil, forkCount: Int, openGraphImageUrl: String, projects: Project) {
            self.init(unsafeResultMap: ["__typename": "Repository", "name": name, "description": description, "primaryLanguage": primaryLanguage.flatMap { (value: PrimaryLanguage) -> ResultMap in value.resultMap }, "forkCount": forkCount, "openGraphImageUrl": openGraphImageUrl, "projects": projects.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The name of the repository.
          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// The description of the repository.
          public var description: String? {
            get {
              return resultMap["description"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "description")
            }
          }

          /// The primary language of the repository's code.
          public var primaryLanguage: PrimaryLanguage? {
            get {
              return (resultMap["primaryLanguage"] as? ResultMap).flatMap { PrimaryLanguage(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "primaryLanguage")
            }
          }

          /// Returns how many forks there are of this repository in the whole network.
          public var forkCount: Int {
            get {
              return resultMap["forkCount"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "forkCount")
            }
          }

          /// The image used to represent this repository in Open Graph data.
          public var openGraphImageUrl: String {
            get {
              return resultMap["openGraphImageUrl"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "openGraphImageUrl")
            }
          }

          /// A list of projects under the owner.
          public var projects: Project {
            get {
              return Project(unsafeResultMap: resultMap["projects"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "projects")
            }
          }

          public struct PrimaryLanguage: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Language"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String) {
              self.init(unsafeResultMap: ["__typename": "Language", "name": name])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The name of the current language.
            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }
          }

          public struct Project: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["ProjectConnection"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(totalCount: Int) {
              self.init(unsafeResultMap: ["__typename": "ProjectConnection", "totalCount": totalCount])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Identifies the total count of items in the connection.
            public var totalCount: Int {
              get {
                return resultMap["totalCount"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "totalCount")
              }
            }
          }
        }
      }
    }
  }
}
