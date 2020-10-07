import React from 'react';
import PropTypes from "prop-types";

import { Book } from './Book';
import { useFetch } from '../../../hooks/useFetch';

const propTypes = {
  url: PropTypes.string.isRequired,
};

const BooksList = ({ url }) => {
  const { response: books, error, isLoading } = useFetch(url);


  if (error) {
    return <pre>{JSON.stringify(error)}</pre>
  }

  if (isLoading) {
    return <div>Loading...</div>
  }

  return (
    <ul>
      {
        books.map(book => (<Book
          key={book.id}
          {...book}
        />))
      }
    </ul>
  );
}

BooksList.propTypes = propTypes;

export { BooksList };