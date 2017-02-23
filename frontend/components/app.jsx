import React from 'react';
import HeaderContainer from './header/header_container';
import AuthContainer from './auth/auth_container';

const App = ({ children }) => (
  <div>
    <HeaderContainer />
    <main>
      {children}
    </main>
    <AuthContainer />
  </div>
);

export default App;
