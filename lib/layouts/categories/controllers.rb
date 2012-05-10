class UIViewController
  PRESENTATION_STYLES = {
    default: UIModalPresentationFormSheet,
    full: UIModalPresentationFullScreen,
    page: UIModalPresentationPageSheet,
    form: UIModalPresentationFormSheet,
    current: UIModalPresentationCurrentContext
  }

  TRANSITION_STYLES = {
    default: UIModalTransitionStyleCoverVertical,
    vertical: UIModalTransitionStyleCoverVertical,
    flip: UIModalTransitionStyleFlipHorizontal,
    dissolve: UIModalTransitionStyleCrossDissolve,
    curl: UIModalTransitionStylePartialCurl
  }

  def createModal(opts={})
    raise ExpectingHashParameter unless opts.is_a?(Hash)
    klass = opts.fetch(:view, nil)
    raise MissingViewException if klass.nil?

    presentation = PRESENTATION_STYLES.fetchWithDefault(opts[:style])
    transition = TRANSITION_STYLES.fetchWithDefault(opts[:transition])

    modal = klass.alloc.init
    modal.delegate = self
    modal.modalPresentationStyle = presentation
    modal.modalTransitionStyle = transition

    def modal.show
      self.delegate.presentModalViewController(self, animated:true)
    end

    modal
  end
end
