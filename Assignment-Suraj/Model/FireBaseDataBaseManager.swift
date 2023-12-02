import Firebase
import Foundation
import FirebaseDatabase

final class FireBaseDataBaseManager {
    static let shared = FireBaseDataBaseManager()
    let userID = Auth.auth().currentUser?.uid
    private init() {}

    func createReference(token: String, posts: [PostModel]) {
        let rootReference = Database.database().reference()

        for (index, post) in posts.enumerated() {
            let postReference = rootReference.child("users").child("\(token)").child("posts").child("post_\(index)")

            postReference.setValue([
                "imageUrls": post.imageUrls,
                "postCreationDate": post.postCreationDate,
                "userId": post.userId,
                "postDescription": post.postDescription
            ])

            postReference.observeSingleEvent(of: .value) { (dataSnapshot) in
                print(dataSnapshot)
            }
        }
    }
}
