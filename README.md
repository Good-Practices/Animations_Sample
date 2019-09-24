# Animations Sample
Good practices while creating animations in iOS using Swift

## Doing Animation
There are many types of animation style but in this repo we wanted to use a high level API which is 'UIPropertyAnimator' because it gives the flexibility to pause stop and start animation at several times and interact while the animation goes on there are also low level API such as Core Animation but to do CA we need to know which keyPath to go on etc. why we are not using UIView.animate because its not chainable and heared some rumors about it which says that its gona be deprecated...

### Animation Types
1. Transformation
    1. scaling
    2. rotating
    3. moving
2. Constraints
3. several other animatable Properties such as
    1. backgroundColor
    2. cornerRadius
    3. opacity
        1. fade in
        2. fade out
etc..

#### Good Things to Remember

1. UIPropertyAnimator has several approuches to use so the first thing what we need to know is using the sources as good as we can besides the concept, we should be aware of performance there is a function called
`UIViewPropertyAnimator.runningPropertyAnimator()` which gets several things like options, duration animation and completion best thing of this is it comes with several extra benefits and you dont need to call `.startAnimation()` after we created the propertyAnimator when we should construct it in that way is when we need to chain animations or we dont know when it starts then its time to use the initializer rather than this class function.

2. When we are chaining animations we should use `.addAnimations()` or if its an ending animation we should use `.addCompletion()` and create an `UIViewPropertyAnimator.runningPropertyAnimator()` inside it so it can reverse the animation or do a completion animation to make it look smoother.

3. when we are using transform and we want to revert back the animation to its initial value there is a value called `.identity` which forces it back to its initial value some times its not on the point `CGPoint(x: 0, y: 0)` so its beter to use `.identity`

4. when we are playing with constraint priorities we need to call the layoutIfNeeded on superview not on the view which has the constraints otherwise it will update it at the end of animation which we dont want it that way

5. there are some timing curves which dedicates the animation timing curve until now with `UIView.animate()` had easIn, easOut easeInOut etc.. but now we can provide our own timing curves to give spesific timing for animations on UIPropertyViewAnimator so what we do is we provide 2 control points and make a parabol out of a linear timing curve so the animation behaves based on our control points.

# Contributers
@onurhuseyincantay