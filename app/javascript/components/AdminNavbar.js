import { Link } from 'react-router'
import Navbar from '../shared/components/Navbar'
import React from 'react'

class AdminNavbar extends React.Component {
  render() {
    return (
      <div>
        <nav class="pt-navbar .modifier">
          <div class="pt-navbar-group pt-align-left">
            <div class="pt-navbar-heading">Veterans 360</div>
          </div>
          <div class="pt-navbar-group pt-align-right">
            <a href={`/admins/applications`}><button class="pt-button pt-minimal pt-icon-comparison">Applications</button></a>
            <a href={`/admins/resources`}><button class="pt-button pt-minimal pt-icon-document">Resources</button></a>
            <span class="pt-navbar-divider"></span>
            <button class="pt-button pt-minimal pt-icon-user">Profile</button>
            <button class="pt-button pt-minimal pt-icon-log-out">Log out</button>
          </div>
        </nav>
      </div>
    )
  }
}

export default AdminNavbar
