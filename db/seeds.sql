-- \c newdads
-- TRUNCATE TABLE users, messages, comments RESTART IDENTITY;


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
 (2, 'Sanity', 'A dingo ate my baby', CURRENT_TIMESTAMP),
 (3, 'Pregnancy', 'Where do babies come from?', CURRENT_TIMESTAMP),
 (1, 'Schools', 'Any thoughts on where the best school is on the UWS?', CURRENT_TIMESTAMP)
 ;

INSERT INTO comments
 (message_id, user_id, comment, created_at)
 VALUES
 (2, 1, 'They come from the lettuce patch', CURRENT_TIMESTAMP),
 (2, 2, 'The stork brings them', CURRENT_TIMESTAMP),
 (1, 1, 'Lets go dingo hunting', CURRENT_TIMESTAMP),
 (3, 2, 'There is a great one on 86th and Amsterdam called Little Minds', CURRENT_TIMESTAMP)
 ;