//
//  MessageThreadDetailTableViewController.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import MessageKit

class MessageThreadDetailTableViewController: MessagesViewController {

    // MARK: - Properties
    
    var messageThread: MessageThread?
    var messageThreadController: MessageThreadController?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = messageThread?.title
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddMessage" {
            guard let destinationVC = segue.destination as? MessageDetailViewController else { return }
            
            destinationVC.messageThreadController = messageThreadController
            destinationVC.messageThread = messageThread
        }
    }    
}

// MARK: - MessagesViewControllerDataSource

extension MessageThreadDetailTableViewController: MessagesDataSource {

    func currentSender() -> SenderType {
        return Sender(senderId: UUID().uuidString, displayName: "Fernando")
    }

    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messageThread?.messages.count ?? 0
    }

    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {

        //guard let message = messageThread?.messages[indexPath.section] else { return MessageType }
        let message = messageThread!.messages[indexPath.section]
        
        return message
    }
}

extension MessageThreadDetailTableViewController: MessagesDisplayDelegate, MessagesLayoutDelegate {}
