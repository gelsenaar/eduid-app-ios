//
// AccountLinkerControllerAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class AccountLinkerControllerAPI {

    /**
     Start link account flow
     
     - returns: AuthorizationURL
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func startSPLinkAccountFlow() async throws -> AuthorizationURL {
        return try await startSPLinkAccountFlowWithRequestBuilder().execute().body
    }

    /**
     Start link account flow
     - GET /mobile/api/sp/oidc/link
     - Start the link account flow for the current user.<br/>After the account has been linked the user is redirect to one the following URL's:<ul><li>Success: <a href=\"\">https://login.{environment}.eduid.nl/client/mobile/account-linked</a></li><li>Failure, EPPN already linked: <a href=\"\">https://login.{environment}.eduid.nl/client/mobile/eppn-already-linked?email=jdoe%40example.com</a></li><li>Failure, session expired: <a href=\"\">https://login.{environment}.eduid.nl/client/mobile/expired</a></li></ul>
     - :
       - type: openIdConnect
       - name: openId
     - returns: RequestBuilder<AuthorizationURL> 
     */
    open class func startSPLinkAccountFlowWithRequestBuilder() -> RequestBuilder<AuthorizationURL> {
        let localVariablePath = "/mobile/api/sp/oidc/link"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<AuthorizationURL>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }
}
