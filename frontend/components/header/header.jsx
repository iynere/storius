import React from 'react';
import { Link } from 'react-router';


const Header = ({ currentUser, logout, toggleAuthModal, setAuthFormType }) => {
  const openLogin = () => {
    setAuthFormType('login');
    toggleAuthModal();
  };

  const openSignup = () => {
    setAuthFormType('signup');
    toggleAuthModal();
  };
  const AuthActions = () => (
    <div>
      <span className="header-action" onClick={openLogin}>Log In</span>
      <span className="header-action" onClick={openSignup}>Sign Up</span>
    </div>
  );
  const UserActions = () => (
    <div>
      <span>{currentUser.username}</span>
      <span className="header-action" onClick={logout}>Sign Out</span>
    </div>
  );
  const UserNav = () => {
    if (currentUser !== null) {
      return (
        <div>
          <Link to="/new">add a stori</Link>
          <span>|</span>
        </div>
      );
    }
    return null;
  };
  return (
    <div className="header">
      <header className="header-primary">
        <input className="header-searchbar" type="text" placeholder="SEARCH" />
        <div className="logo-link">
          <Link to="/" className="logo-link">
            STORIUS
          </Link>
        </div>
        <div className="header-actions">
          { currentUser === null ? AuthActions() : UserActions() }
        </div>
      </header>
      <header className="header-nav">
        <Link to={'/#topSongs'}>top songs</Link>
        <span>|</span>
        { UserNav() }
        <a
          href="https://www.facebook.com/elie.a.finer"
          target="_blank"
          rel="noopener noreferrer"
        >
          <i className="fa fa-facebook" />
        </a>
        <a
          href="https://github.com/NothingFiner/storius"
          target="_blank"
          rel="noopener noreferrer"
        >
          <i className="fa fa-github" />
        </a>
        <a
          href="https://www.instagram.com/hashtag_durbatuluk/"
          target="_blank"
          rel="noopener noreferrer"
        >
          <i className="fa fa-instagram" />
        </a>
        <a
          href="https://www.youtube.com/watch?v=2HQaBWziYvY"
          target="_blank"
          rel="noopener noreferrer"
        >
          <i className="fa fa-youtube-play" />
        </a>
      </header>
    </div>
  );
};

Header.propTypes = {
  logout: React.PropTypes.func.isRequired,
  toggleAuthModal: React.PropTypes.func.isRequired,
  setAuthFormType: React.PropTypes.func.isRequired,
  currentUser: React.PropTypes.shape({
    id: React.PropTypes.integer,
    username: React.PropTypes.string,
    email: React.PropTypes.string,
    bio: React.PropTypes.string,
  }),
};

Header.defaultProps = {
  currentUser: null,
};

export default Header;
