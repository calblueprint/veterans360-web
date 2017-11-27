import Modal from 'react-bootstrap-modal'
import PropTypes from "prop-types"
import React from "react"
import ResourceModal from './ResourceModal.js'
import request from '../shared/requests/request'

class ViewResources extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      resources: [],
    }
    this._mounted = false
  }

  componentDidMount() {
    this._mounted = true
    this.getResources()
  }

  componentWillUnmount() {
    this._mounted = false
  }

  getResources() {
    // this is hacky, should use the api so it can format as json but couldn't get the route to work :(
    const path = `/resources/`

    request.get(path, (response) => {
      this._mounted && this.setState({ resources: response })
    }, (error) => {
      console.log(error)
    })
  }

  renderResources() {
    return this.state.resources.map((resource) => {
      return (
        <li key={resource.id}>
          <ResourceModal resource={resource} />
        </li>
      )
    })
  }

  render () {
    return (
      <div className='flex center'>
        <div className='container marginTop-xxl'>
          <h2 className='h2'>List of Resources</h2>
          <ul>
            {this.renderResources()}
          </ul>
        </div>
      </div>
    )
  }
}

export default ViewResources
