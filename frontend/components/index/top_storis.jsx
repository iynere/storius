import React from 'react';
import { Link } from 'react-router';
import { values } from 'lodash';

const TopStoris = ({ storis }) => {
  const StoriItem = (stori, i) => {
    let classNames = 'row top-stori';
    let storiText;
    if (i < 3) {
      classNames = classNames.concat(' big');
      storiText = () => (
        <div className="stori-text">
          <h3>{stori.title}</h3>
          <h5>{stori.author}</h5>
        </div>
      );
    } else {
      storiText = () => (
        <div className="stori-text">
          <h5>{stori.title} by {stori.author}</h5>
        </div>
      );
    }
    if (i === 0) {
      classNames = classNames.concat(' big-border-top');
    }
    return (
      <Link className={classNames} to={`storis/${stori.id}`}>
        <div className="stori-number">
          <h3>{i + 1}</h3>
        </div>
        <div className="stori-art" />
        <div className="stori-text">
          { storiText() }
        </div>
      </Link>
    );
  };
  const StoriItems = () => (
    values(storis).map((stori, i) => (
      <li key={stori.id}>
        { StoriItem(stori, i) }
      </li>
    ))
  );
  return (
    <div className="top-stori-container">
      <div className="column">
        <h3 className="margin-bottom-1rem">Top Storis</h3>
      </div>
      <div className="column">
        <ul className="stori-table width-full">
          { StoriItems() }
        </ul>
      </div>
    </div>
  );
};


export default TopStoris;
