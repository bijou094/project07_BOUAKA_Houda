const express =require('express');
const mysql =  require('mysql');
const db = require ('../baseD/db.js');

function Message(message) { 
    this.idUser = message.idUser;      
    this.content=message.content;    
    this.messageUrl=message.messageUrl;
    this.createdAt=new Date();
    this.updatedAt=new Date();
}
module.exports = Message;



// creation d'un message
Message.create = (newMessage, result) =>{
  const sqlInsert = "INSERT INTO messages SET ? ";
  db.query(sqlInsert,newMessage,(err, res) =>{        
    if (err){result(err, null); return;
    }else{result(null,{id:res.id, ...newMessage })}
  })
};

// Récupérer le dernier message

Message.getLatest = (id, result) => {
  const sqlSelectLast = "SELECT messages.*, users.pseudo , users.imageUrl From messages Left JOIN users ON messages.idUser = users.id  ORDER BY id DESC LIMIT 0,1";
  db.query(sqlSelectLast,id,(err, res) => {
      if(err) {
          result(err, null);
          return;
      } else {
          result(null, res[0])
      }
  })
};
 // Récupérer tous les  messages
Message.findAllMessage = (result) => {    
  const sqlFindAllMsg = "SELECT messages.*, users.pseudo , users.imageUrl From messages Left JOIN users ON messages.idUser = users.id  ORDER BY createdAt DESC";  
  db.query(sqlFindAllMsg, (err, res) => {
        if(err) {
            result(err, null);
            return;
        } else {
            result(null, res)
        }
    })
};
// Récupérer un seule message
Message.findOneMessage = (id, result) => {
  const sqlFindOneMsg = " SELECT messages.*, users.pseudo , users.imageUrl FROM messages LEFT JOIN users ON messages.idUser= users.id WHERE messages.id=? ORDER BY createdAt DESC";    
  db.query(sqlFindOneMsg, id, (err, res) => {
    if(err){result(err, null);return;
    } else {result(null, res)}
  })
};

// Récupérer modifier le  message
Message.updateMessage = ( message, result) => {  
  const sqlUpdateMsg = "UPDATE messages SET content=?, messageUrl=? WHERE id=? ";    
  db.query(sqlUpdateMsg,[message.content, message.messageUrl,message.id], (err, res) => {
    if(err){result(err, null);return;
    } else {result(null, res)}
  })
}

// supprimer un message
Message.deleteMessage = ( id, result) => {
  const sqlUpdateMsg = "DELETE FROM messages  WHERE id=?";    
  db.query(sqlUpdateMsg, id, (err, res) => {
    if(err){result(err, null);return;
    } else {result(null, res)}
  })
};






