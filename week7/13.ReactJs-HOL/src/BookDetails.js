import React from 'react';

function BookDetails() {
  const books = [
    { id: 1, title: 'Harry Potter', author: 'J.K. Rowling' },
    { id: 2, title: 'Atomic Habits', author: 'James Clear' }
  ];

  return (
    <div>
      <h3>Book Details</h3>
      <ul>
        {books.map(book => (
          <li key={book.id}>
            {book.title} — {book.author}
          </li>
        ))}
      </ul>
    </div>
  );
}

export default BookDetails;
