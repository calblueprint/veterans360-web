import PropTypes from "prop-types"
import React from "react"
import ApplicationModal from './ApplicationModal.js'
import request from '../../shared/requests/request'

class ViewApplications extends React.Component {
  constructor(props) {
    super(props)
  }

  renderApplications() {
    return this.props.partner_orgs.map((application) => {
      return (
        <li key={application.id}>
          <ApplicationModal
            application={application}
            categories={this.props.categories}
          />
        </li>
      )
    })
  }

  render () {
    return (
      <div className='container'>
        <h2 className='container-header'>List of Partnering Organizations</h2>
        <ul>
          {this.renderApplications()}
        </ul>
      </div>
    )
  }
}

export default ViewApplications
