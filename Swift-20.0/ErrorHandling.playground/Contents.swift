//: Playground - noun: a place where people can play

import Cocoa

enum Token {
    case Number(Int)
    case Plus
}

class Lexer {
    let input: String.CharacterView
    var position: String.CharacterView.Index
    
    enum LexerError: Error {
        case InvalidCharacter(Character)
    }
    
    init (input: String) {
        self.input = input.characters
        self.position = self.input.startIndex
    }
    
    func peek() -> Character? {
        guard position < input.endIndex else {
            return nil
        }
        return input[position]
    }

    func advance() {
        assert(position < input.endIndex, "Cannot advance past the end!")
        position = self.input.index(after: position)
    }
    
    func getNumber() -> Int {
        var value = 0
        
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0" ... "9":
                let digitValue = Int(String(nextCharacter))!
                value = 10*value + digitValue
                advance()
            default:
                // A non-digit - go back to regular lexing
                return value
            }
        }
        return value
    }
    
    func lex() throws -> [Token] {
        var tokens = [Token]()
        
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0" ... "9":
                // Start of a number - need to grab the rest
                let value = getNumber()
                tokens.append(.Number(value))
            case "+":
                tokens.append(.Plus)
                advance()
            case " ":
                // Just advance to ignore spaces
                advance()
            default:
                // Something unexpected - need to send back an error
                throw LexerError.InvalidCharacter(nextCharacter)
            }
        }
        return tokens
    }
}

class Parser {
    enum ParseError: Error {
        case UnexpectedEndOfInput
        case InvalidToken(Token)
    }
    
    let tokens: [Token]
    var position = 0
    
    init (tokens: [Token]) {
        self.tokens = tokens
    }
    
    func getNextToken() -> Token? {
        guard position < tokens.count else {
            return nil
        }
        position = position + 1
        return tokens[position - 1]
    }
    
    func getNumber() throws -> Int {
        guard let token = getNextToken() else {
            throw ParseError.UnexpectedEndOfInput
        }
        switch token {
        case .Number(let value):
            return value
        case .Plus:
            throw ParseError.InvalidToken(token)
        }
    }
    
    func parse() throws -> Int {
        // Require a number first
        var value = try getNumber()
        while let token = getNextToken() {
            switch token {
            case .Plus:
                let nexNumber = try getNumber()
                value += nexNumber
            case .Number:
                throw ParseError.InvalidToken(token)
            }
        }
        return value
    }
}

func evaluate(input: String) {
    print("Evaluating: \(input)")
    let lexer = Lexer(input: input)
    do {
        let tokens = try lexer.lex()
        print("Lexer output: \(tokens)")
        let parser = Parser(tokens: tokens)
        let result = try parser.parse()
        print("Parser output: \(result)")
    } catch Lexer.LexerError.InvalidCharacter(let character){
        print("Input contained an invalid character: \(character)")
    } catch Parser.ParseError.UnexpectedEndOfInput {
        print("Unexpected end of input during parsing")
    } catch Parser.ParseError.InvalidToken(let token) {
        print("Invalid token during parsing: \(token)")
    } catch {
        print("An error ocurred: \(error)")
    }
}

evaluate(input: "10 + 3 + 5")
