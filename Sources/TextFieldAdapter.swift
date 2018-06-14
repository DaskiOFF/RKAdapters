import UIKit

public class TextFieldAdapter {
    var textField: UITextField
    
    // MARK: - Properties
    private var textFieldAdapterDelegate: TextFieldAdapterDelegate!
    public var shouldReturn: Bool
    
    // MARK: - Callbacks
    public typealias DidReturn = (UITextField) -> Bool
    public typealias DidBeginEndEditing = (UITextField) -> Void
    public typealias DidTextChanged = (_ textField: UITextField, _ text: String) -> Void
    
    private(set) var didReturn: DidReturn?
    private(set) var didBeginEditing: DidBeginEndEditing?
    private(set) var didEndEditing: DidBeginEndEditing?
    private(set) var didTextChanged: DidTextChanged?
    
    public init(textField: UITextField) {
        self.textField = textField
        shouldReturn = true
        
        textFieldAdapterDelegate = TextFieldAdapterDelegate(holder: self)
        
        self.textField.delegate = textFieldAdapterDelegate
        self.textField.addTarget(self, action: #selector(TextFieldAdapter.textFieldDidChangeText(_:)), for: .editingChanged)
    }
    
    // MARK: - Setters
    public func setDidReturn(_ block: DidReturn?) {
        didReturn = block
    }
    
    public func setDidBeginEditing(_ block: DidBeginEndEditing?) {
        didBeginEditing = block
    }
    
    public func setDidEndEditing(_ block: DidBeginEndEditing?) {
        didEndEditing = block
    }
    
    public func setDidTextChanged(_ block: DidTextChanged?) {
        didTextChanged = block
    }
    
    @objc
    func textFieldDidChangeText(_ textField: UITextField) {
        didTextChanged?(textField, textField.text ?? "")
    }
}

class TextFieldAdapterDelegate: NSObject, UITextFieldDelegate {
    unowned var holder: TextFieldAdapter
    
    init(holder: TextFieldAdapter) {
        self.holder = holder
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        holder.didBeginEditing?(textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        holder.didEndEditing?(textField)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return holder.didReturn?(textField) ?? holder.shouldReturn
    }
    
    func textField(_: UITextField, shouldChangeCharactersIn _: NSRange, replacementString _: String) -> Bool {
        return true
    }
}
