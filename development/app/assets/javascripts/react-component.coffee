##
# @cjsx React.DOM
##

RadComponent = React.createClass
  render: ->
    <div className="rad-component">
      <h1>{@props.rad}</h1>
    </div>

module.exports = RadComponent
