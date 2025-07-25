"""
This file was generated by the KCL auto-gen tool. DO NOT EDIT.
Editing this file might prove futile when you re-run the KCL auto-gen generate command.
"""
import k8s.apimachinery.pkg.apis.meta.v1


schema OpenIDConnectProvider:
    r"""
    OpenIDConnectProvider is the Schema for the OpenIDConnectProviders API. Provides an IAM OpenID Connect provider.

    Attributes
    ----------
    apiVersion : str, default is "iam.aws.upbound.io/v1beta1", required
        APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    kind : str, default is "OpenIDConnectProvider", required
        Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    metadata : v1.ObjectMeta, default is Undefined, optional
        metadata
    spec : IamAwsUpboundIoV1beta1OpenIDConnectProviderSpec, default is Undefined, required
        spec
    status : IamAwsUpboundIoV1beta1OpenIDConnectProviderStatus, default is Undefined, optional
        status
    """


    apiVersion: "iam.aws.upbound.io/v1beta1" = "iam.aws.upbound.io/v1beta1"

    kind: "OpenIDConnectProvider" = "OpenIDConnectProvider"

    metadata?: v1.ObjectMeta

    spec: IamAwsUpboundIoV1beta1OpenIDConnectProviderSpec

    status?: IamAwsUpboundIoV1beta1OpenIDConnectProviderStatus


schema IamAwsUpboundIoV1beta1OpenIDConnectProviderSpec:
    r"""
    OpenIDConnectProviderSpec defines the desired state of OpenIDConnectProvider

    Attributes
    ----------
    deletionPolicy : str, default is "Delete", optional
        DeletionPolicy specifies what will happen to the underlying external
        when this managed resource is deleted - either "Delete" or "Orphan" the
        external resource.
        This field is planned to be deprecated in favor of the ManagementPolicies
        field in a future release. Currently, both could be set independently and
        non-default values would be honored if the feature flag is enabled.
        See the design doc for more information: https://github.com/crossplane/crossplane/blob/499895a25d1a1a0ba1604944ef98ac7a1a71f197/design/design-doc-observe-only-resources.md?plain=1#L223
    forProvider : IamAwsUpboundIoV1beta1OpenIDConnectProviderSpecForProvider, default is Undefined, required
        for provider
    initProvider : IamAwsUpboundIoV1beta1OpenIDConnectProviderSpecInitProvider, default is Undefined, optional
        init provider
    managementPolicies : [str], default is ["*"], optional
        THIS IS A BETA FIELD. It is on by default but can be opted out
        through a Crossplane feature flag.
        ManagementPolicies specify the array of actions Crossplane is allowed to
        take on the managed and external resources.
        This field is planned to replace the DeletionPolicy field in a future
        release. Currently, both could be set independently and non-default
        values would be honored if the feature flag is enabled. If both are
        custom, the DeletionPolicy field will be ignored.
        See the design doc for more information: https://github.com/crossplane/crossplane/blob/499895a25d1a1a0ba1604944ef98ac7a1a71f197/design/design-doc-observe-only-resources.md?plain=1#L223
        and this one: https://github.com/crossplane/crossplane/blob/444267e84783136daa93568b364a5f01228cacbe/design/one-pager-ignore-changes.md
    providerConfigRef : IamAwsUpboundIoV1beta1OpenIDConnectProviderSpecProviderConfigRef, default is Undefined, optional
        provider config ref
    publishConnectionDetailsTo : IamAwsUpboundIoV1beta1OpenIDConnectProviderSpecPublishConnectionDetailsTo, default is Undefined, optional
        publish connection details to
    writeConnectionSecretToRef : IamAwsUpboundIoV1beta1OpenIDConnectProviderSpecWriteConnectionSecretToRef, default is Undefined, optional
        write connection secret to ref
    """


    deletionPolicy?: "Orphan" | "Delete" = "Delete"

    forProvider: IamAwsUpboundIoV1beta1OpenIDConnectProviderSpecForProvider

    initProvider?: IamAwsUpboundIoV1beta1OpenIDConnectProviderSpecInitProvider

    managementPolicies?: [str] = ["*"]

    providerConfigRef?: IamAwsUpboundIoV1beta1OpenIDConnectProviderSpecProviderConfigRef

    publishConnectionDetailsTo?: IamAwsUpboundIoV1beta1OpenIDConnectProviderSpecPublishConnectionDetailsTo

    writeConnectionSecretToRef?: IamAwsUpboundIoV1beta1OpenIDConnectProviderSpecWriteConnectionSecretToRef


schema IamAwsUpboundIoV1beta1OpenIDConnectProviderSpecForProvider:
    r"""
    iam aws upbound io v1beta1 open ID connect provider spec for provider

    Attributes
    ----------
    clientIdList : [str], default is Undefined, optional
        List of client IDs (audiences) that identify the application registered with the OpenID Connect provider. This is the value sent as the client_id parameter in OAuth requests.
    tags : {str:str}, default is Undefined, optional
        Key-value map of resource tags.
    thumbprintList : [str], default is Undefined, optional
        List of server certificate thumbprints for the OpenID Connect (OIDC) identity provider's server certificate(s). For certain OIDC identity providers (e.g., Auth0, GitHub, GitLab, Google, or those using an Amazon S3-hosted JWKS endpoint), AWS relies on its own library of trusted root certificate authorities (CAs) for validation instead of using any configured thumbprints. In these cases, any configured thumbprint_list is retained in the configuration but not used for verification. For other IdPs, if no thumbprint_list is provided, IAM automatically retrieves and uses the top intermediate CA thumbprint from the OIDC IdP server certificate. Instead, it continues using the original thumbprint list from the initial configuration. This differs from the behavior when creating an aws_iam_openid_connect_provider without a thumbprint_list.
    url : str, default is Undefined, optional
        URL of the identity provider, corresponding to the iss claim.
    """


    clientIdList?: [str]

    tags?: {str:str}

    thumbprintList?: [str]

    url?: str


schema IamAwsUpboundIoV1beta1OpenIDConnectProviderSpecInitProvider:
    r"""
    THIS IS A BETA FIELD. It will be honored
    unless the Management Policies feature flag is disabled.
    InitProvider holds the same fields as ForProvider, with the exception
    of Identifier and other resource reference fields. The fields that are
    in InitProvider are merged into ForProvider when the resource is created.
    The same fields are also added to the terraform ignore_changes hook, to
    avoid updating them after creation. This is useful for fields that are
    required on creation, but we do not desire to update them after creation,
    for example because of an external controller is managing them, like an
    autoscaler.

    Attributes
    ----------
    clientIdList : [str], default is Undefined, optional
        List of client IDs (audiences) that identify the application registered with the OpenID Connect provider. This is the value sent as the client_id parameter in OAuth requests.
    tags : {str:str}, default is Undefined, optional
        Key-value map of resource tags.
    thumbprintList : [str], default is Undefined, optional
        List of server certificate thumbprints for the OpenID Connect (OIDC) identity provider's server certificate(s). For certain OIDC identity providers (e.g., Auth0, GitHub, GitLab, Google, or those using an Amazon S3-hosted JWKS endpoint), AWS relies on its own library of trusted root certificate authorities (CAs) for validation instead of using any configured thumbprints. In these cases, any configured thumbprint_list is retained in the configuration but not used for verification. For other IdPs, if no thumbprint_list is provided, IAM automatically retrieves and uses the top intermediate CA thumbprint from the OIDC IdP server certificate. Instead, it continues using the original thumbprint list from the initial configuration. This differs from the behavior when creating an aws_iam_openid_connect_provider without a thumbprint_list.
    url : str, default is Undefined, optional
        URL of the identity provider, corresponding to the iss claim.
    """


    clientIdList?: [str]

    tags?: {str:str}

    thumbprintList?: [str]

    url?: str


schema IamAwsUpboundIoV1beta1OpenIDConnectProviderSpecProviderConfigRef:
    r"""
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, default is Undefined, required
        Name of the referenced object.
    policy : IamAwsUpboundIoV1beta1OpenIDConnectProviderSpecProviderConfigRefPolicy, default is Undefined, optional
        policy
    """


    name: str

    policy?: IamAwsUpboundIoV1beta1OpenIDConnectProviderSpecProviderConfigRefPolicy


schema IamAwsUpboundIoV1beta1OpenIDConnectProviderSpecProviderConfigRefPolicy:
    r"""
    Policies for referencing.

    Attributes
    ----------
    resolution : str, default is "Required", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : str, default is Undefined, optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """


    resolution?: "Required" | "Optional" = "Required"

    resolve?: "Always" | "IfNotPresent"


schema IamAwsUpboundIoV1beta1OpenIDConnectProviderSpecPublishConnectionDetailsTo:
    r"""
    PublishConnectionDetailsTo specifies the connection secret config which
    contains a name, metadata and a reference to secret store config to
    which any connection details for this managed resource should be written.
    Connection details frequently include the endpoint, username,
    and password required to connect to the managed resource.

    Attributes
    ----------
    configRef : IamAwsUpboundIoV1beta1OpenIDConnectProviderSpecPublishConnectionDetailsToConfigRef, default is Undefined, optional
        config ref
    metadata : IamAwsUpboundIoV1beta1OpenIDConnectProviderSpecPublishConnectionDetailsToMetadata, default is Undefined, optional
        metadata
    name : str, default is Undefined, required
        Name is the name of the connection secret.
    """


    configRef?: IamAwsUpboundIoV1beta1OpenIDConnectProviderSpecPublishConnectionDetailsToConfigRef

    metadata?: IamAwsUpboundIoV1beta1OpenIDConnectProviderSpecPublishConnectionDetailsToMetadata

    name: str


schema IamAwsUpboundIoV1beta1OpenIDConnectProviderSpecPublishConnectionDetailsToConfigRef:
    r"""
    SecretStoreConfigRef specifies which secret store config should be used
    for this ConnectionSecret.

    Attributes
    ----------
    name : str, default is Undefined, required
        Name of the referenced object.
    policy : IamAwsUpboundIoV1beta1OpenIDConnectProviderSpecPublishConnectionDetailsToConfigRefPolicy, default is Undefined, optional
        policy
    """


    name: str

    policy?: IamAwsUpboundIoV1beta1OpenIDConnectProviderSpecPublishConnectionDetailsToConfigRefPolicy


schema IamAwsUpboundIoV1beta1OpenIDConnectProviderSpecPublishConnectionDetailsToConfigRefPolicy:
    r"""
    Policies for referencing.

    Attributes
    ----------
    resolution : str, default is "Required", optional
        Resolution specifies whether resolution of this reference is required.
        The default is 'Required', which means the reconcile will fail if the
        reference cannot be resolved. 'Optional' means this reference will be
        a no-op if it cannot be resolved.
    resolve : str, default is Undefined, optional
        Resolve specifies when this reference should be resolved. The default
        is 'IfNotPresent', which will attempt to resolve the reference only when
        the corresponding field is not present. Use 'Always' to resolve the
        reference on every reconcile.
    """


    resolution?: "Required" | "Optional" = "Required"

    resolve?: "Always" | "IfNotPresent"


schema IamAwsUpboundIoV1beta1OpenIDConnectProviderSpecPublishConnectionDetailsToMetadata:
    r"""
    Metadata is the metadata for connection secret.

    Attributes
    ----------
    annotations : {str:str}, default is Undefined, optional
        Annotations are the annotations to be added to connection secret.
        - For Kubernetes secrets, this will be used as "metadata.annotations".
        - It is up to Secret Store implementation for others store types.
    labels : {str:str}, default is Undefined, optional
        Labels are the labels/tags to be added to connection secret.
        - For Kubernetes secrets, this will be used as "metadata.labels".
        - It is up to Secret Store implementation for others store types.
    $type : str, default is Undefined, optional
        Type is the SecretType for the connection secret.
        - Only valid for Kubernetes Secret Stores.
    """


    annotations?: {str:str}

    labels?: {str:str}

    $type?: str


schema IamAwsUpboundIoV1beta1OpenIDConnectProviderSpecWriteConnectionSecretToRef:
    r"""
    WriteConnectionSecretToReference specifies the namespace and name of a
    Secret to which any connection details for this managed resource should
    be written. Connection details frequently include the endpoint, username,
    and password required to connect to the managed resource.
    This field is planned to be replaced in a future release in favor of
    PublishConnectionDetailsTo. Currently, both could be set independently
    and connection details would be published to both without affecting
    each other.

    Attributes
    ----------
    name : str, default is Undefined, required
        Name of the secret.
    namespace : str, default is Undefined, required
        Namespace of the secret.
    """


    name: str

    namespace: str


schema IamAwsUpboundIoV1beta1OpenIDConnectProviderStatus:
    r"""
    OpenIDConnectProviderStatus defines the observed state of OpenIDConnectProvider.

    Attributes
    ----------
    atProvider : IamAwsUpboundIoV1beta1OpenIDConnectProviderStatusAtProvider, default is Undefined, optional
        at provider
    conditions : [IamAwsUpboundIoV1beta1OpenIDConnectProviderStatusConditionsItems0], default is Undefined, optional
        Conditions of the resource.
    observedGeneration : int, default is Undefined, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """


    atProvider?: IamAwsUpboundIoV1beta1OpenIDConnectProviderStatusAtProvider

    conditions?: [IamAwsUpboundIoV1beta1OpenIDConnectProviderStatusConditionsItems0]

    observedGeneration?: int


schema IamAwsUpboundIoV1beta1OpenIDConnectProviderStatusAtProvider:
    r"""
    iam aws upbound io v1beta1 open ID connect provider status at provider

    Attributes
    ----------
    arn : str, default is Undefined, optional
        ARN assigned by AWS for this provider.
    clientIdList : [str], default is Undefined, optional
        List of client IDs (audiences) that identify the application registered with the OpenID Connect provider. This is the value sent as the client_id parameter in OAuth requests.
    id : str, default is Undefined, optional
        id
    tags : {str:str}, default is Undefined, optional
        Key-value map of resource tags.
    tagsAll : {str:str}, default is Undefined, optional
        Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
    thumbprintList : [str], default is Undefined, optional
        List of server certificate thumbprints for the OpenID Connect (OIDC) identity provider's server certificate(s). For certain OIDC identity providers (e.g., Auth0, GitHub, GitLab, Google, or those using an Amazon S3-hosted JWKS endpoint), AWS relies on its own library of trusted root certificate authorities (CAs) for validation instead of using any configured thumbprints. In these cases, any configured thumbprint_list is retained in the configuration but not used for verification. For other IdPs, if no thumbprint_list is provided, IAM automatically retrieves and uses the top intermediate CA thumbprint from the OIDC IdP server certificate. Instead, it continues using the original thumbprint list from the initial configuration. This differs from the behavior when creating an aws_iam_openid_connect_provider without a thumbprint_list.
    url : str, default is Undefined, optional
        URL of the identity provider, corresponding to the iss claim.
    """


    arn?: str

    clientIdList?: [str]

    id?: str

    tags?: {str:str}

    tagsAll?: {str:str}

    thumbprintList?: [str]

    url?: str


schema IamAwsUpboundIoV1beta1OpenIDConnectProviderStatusConditionsItems0:
    r"""
    A Condition that may apply to a resource.

    Attributes
    ----------
    lastTransitionTime : str, default is Undefined, required
        LastTransitionTime is the last time this condition transitioned from one
        status to another.
    message : str, default is Undefined, optional
        A Message containing details about this condition's last transition from
        one status to another, if any.
    observedGeneration : int, default is Undefined, optional
        ObservedGeneration represents the .metadata.generation that the condition was set based upon.
        For instance, if .metadata.generation is currently 12, but the .status.conditions[x].observedGeneration is 9, the condition is out of date
        with respect to the current state of the instance.
    reason : str, default is Undefined, required
        A Reason for this condition's last transition from one status to another.
    status : str, default is Undefined, required
        Status of this condition; is it currently True, False, or Unknown?
    $type : str, default is Undefined, required
        Type of this condition. At most one of each condition type may apply to
        a resource at any point in time.
    """


    lastTransitionTime: str

    message?: str

    observedGeneration?: int

    reason: str

    status: str

    $type: str


