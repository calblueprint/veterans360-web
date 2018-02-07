import PropTypes from "prop-types"
import React from "react"
import ApplicationModal from './ApplicationModal.js'
import request from '../../shared/requests/request'

class ViewApplications extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      applications: [],
    }
    this._mounted = false
  }

  componentDidMount() {
    this._mounted = true
    this.getApplications()
  }

  componentWillUnmount() {
    this._mounted = false
  }

  getApplications() {
    // this is hacky, should use the api so it can format as json but couldn't get the route to work :(
    const path = `/partnering_organizations/`

    request.get(path, (response) => {
      this._mounted && this.setState({ applications: response })
    }, (error) => {
      console.log(error)
    })
  }

  renderApplications() {
    return this.state.applications.map((application) => {
      return (
        <li key={application.id}>
          <ApplicationModal application={application} />
        </li>
      )
    })
  }

  render () {
    return (
      <div className='container'>
        <h2 className='container-header'>List of Applications</h2>
        <ul>
          {this.renderApplications()}
        </ul>
      </div>
    )
  }
}

export default ViewApplications
