import { Link } from 'react-router'
import Navbar from '../shared/components/Navbar'
import React from 'react'

class AdminNavbar extends React.Component {
  render() {
    return (
      <div>
        <Navbar>
          <Link
            to='/'>
            <div className="nav-element right">Applications</div>
          </Link>

          <Link
            to='/'>
            <div className="nav-element right">Resources</div>
          </Link>

          <Link
            to='/'>
            <div className="nav-element right">Profile</div>
          </Link>

          <Link
            to='/'>
            <div className="nav-element right">Log Out</div>
          </Link>
        </Navbar>

        <div className='flex center'>
          {this.props.children}
        </div>
      </div>
    )
  }
}

export default AdminNavbar
