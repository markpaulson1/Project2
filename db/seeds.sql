\c gayparents
TRUNCATE TABLE users, messages, comments RESTART IDENTITY;


INSERT INTO users
  (name, email, password, created_at)
VALUES
 	('Mark Paulson', 'markpaulson1@hotmail.com', 'babies1', CURRENT_TIMESTAMP),
  ('Daniel Maury', 'danielmaury@me.com', 'babies2', CURRENT_TIMESTAMP),
  ('Lindsay Lohan', 'trainwreck@gmail.com', 'bigmess', CURRENT_TIMESTAMP)
  ;

INSERT INTO messages
  (user_id, topic, message, created_at)
VALUES
 (2, 'HELP!', 'A dingo ate my baby', CURRENT_TIMESTAMP),
 (3, 'Confused', 'Where do babies come from?', CURRENT_TIMESTAMP),
 (1, 'School Help?', 'Any thoughts on where the best school is on the upper west side?', CURRENT_TIMESTAMP)
 ;

INSERT INTO comments
  (message_id, user_id, message, created_at)
  (2, 1, 'They come from the lettuce patch', CURRENT_TIMESTAMP),
 (2, 2, 'The stork brings them', CURRENT_TIMESTAMP),
 (1, 1, 'Lets go dingo hunting', CURRENT_TIMESTAMP),
 (3, 2, 'There is a great one on 86th and Amsterdam called Little Minds', CURRENT_TIMESTAMP)
 ;