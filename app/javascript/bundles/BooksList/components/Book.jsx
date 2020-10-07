import React from 'react';
import PropTypes from 'prop-types'

const propTypes = {
  title: PropTypes.string.isRequired,
  description: PropTypes.string.isRequired,
  page_count: PropTypes.number.isRequired
};

const Book = ({
  title,
  page_count,
  description,
  categories,
  publisher: { name }
}) => {
  return (
    <li>
      <h3>Title - { title }</h3>
      <p>Publisher - { name }</p>
      <p>Page count: <b>{ page_count }</b></p>
      <p>Description: { description }</p>

      <ul>
        <strong>categories</strong>
        {
          categories.map(
            ({ name, id }, index) => (
              <li key={`${id}-${index}`}>{ name }</li>
            )
          )
        }
      </ul>
    </li>
  );
};

Book.propTypes = propTypes

export { Book }