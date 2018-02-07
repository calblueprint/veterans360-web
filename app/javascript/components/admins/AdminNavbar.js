import { Link } from 'react-router'
import React from 'react'

class AdminNavbar extends React.Component {
  render() {
    return (
      <div>
        <nav className="pt-navbar .modifier">
          <div className="pt-navbar-group pt-align-left">
            <div className="pt-navbar-heading">Veterans 360</div>
          </div>
          <div className="pt-navbar-group pt-align-right">
            <a href={`/admins/applications`}><button className="pt-button pt-minimal pt-icon-comparison">Applications</button></a>
            <a href={`/admins/resources`}><button className="pt-button pt-minimal pt-icon-document">Resources</button></a>
            <span className="pt-navbar-divider"></span>
            <button className="pt-button pt-minimal pt-icon-user">Profile</button>
            <a href={`/admins/sign_out`} data-method="delete"><button className="pt-button pt-minimal pt-icon-log-out">Log out</button></a>
          </div>
        </nav>
      </div>
    )
  }
}

export default AdminNavbar
