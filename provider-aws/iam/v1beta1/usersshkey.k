"""
This file was generated by the KCL auto-gen tool. DO NOT EDIT.
Editing this file might prove futile when you re-run the KCL auto-gen generate command.
"""
import k8s.apimachinery.pkg.apis.meta.v1


schema UserSSHKey:
    r"""
    UserSSHKey is the Schema for the UserSSHKeys API. Uploads an SSH public key and associates it with the specified IAM user.

    Attributes
    ----------
    apiVersion : str, default is "iam.aws.upbound.io/v1beta1", required
        APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    kind : str, default is "UserSSHKey", required
        Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    metadata : v1.ObjectMeta, default is Undefined, optional
        metadata
    spec : IamAwsUpboundIoV1beta1UserSSHKeySpec, default is Undefined, required
        spec
    status : IamAwsUpboundIoV1beta1UserSSHKeyStatus, default is Undefined, optional
        status
    """


    apiVersion: "iam.aws.upbound.io/v1beta1" = "iam.aws.upbound.io/v1beta1"

    kind: "UserSSHKey" = "UserSSHKey"

    metadata?: v1.ObjectMeta

    spec: IamAwsUpboundIoV1beta1UserSSHKeySpec

    status?: IamAwsUpboundIoV1beta1UserSSHKeyStatus


schema IamAwsUpboundIoV1beta1UserSSHKeySpec:
    r"""
    UserSSHKeySpec defines the desired state of UserSSHKey

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
    forProvider : IamAwsUpboundIoV1beta1UserSSHKeySpecForProvider, default is Undefined, required
        for provider
    initProvider : IamAwsUpboundIoV1beta1UserSSHKeySpecInitProvider, default is Undefined, optional
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
    providerConfigRef : IamAwsUpboundIoV1beta1UserSSHKeySpecProviderConfigRef, default is Undefined, optional
        provider config ref
    publishConnectionDetailsTo : IamAwsUpboundIoV1beta1UserSSHKeySpecPublishConnectionDetailsTo, default is Undefined, optional
        publish connection details to
    writeConnectionSecretToRef : IamAwsUpboundIoV1beta1UserSSHKeySpecWriteConnectionSecretToRef, default is Undefined, optional
        write connection secret to ref
    """


    deletionPolicy?: "Orphan" | "Delete" = "Delete"

    forProvider: IamAwsUpboundIoV1beta1UserSSHKeySpecForProvider

    initProvider?: IamAwsUpboundIoV1beta1UserSSHKeySpecInitProvider

    managementPolicies?: [str] = ["*"]

    providerConfigRef?: IamAwsUpboundIoV1beta1UserSSHKeySpecProviderConfigRef

    publishConnectionDetailsTo?: IamAwsUpboundIoV1beta1UserSSHKeySpecPublishConnectionDetailsTo

    writeConnectionSecretToRef?: IamAwsUpboundIoV1beta1UserSSHKeySpecWriteConnectionSecretToRef


schema IamAwsUpboundIoV1beta1UserSSHKeySpecForProvider:
    r"""
    iam aws upbound io v1beta1 user SSH key spec for provider

    Attributes
    ----------
    encoding : str, default is Undefined, optional
        Specifies the public key encoding format to use in the response. To retrieve the public key in ssh-rsa format, use SSH. To retrieve the public key in PEM format, use PEM.
    publicKey : str, default is Undefined, optional
        The SSH public key. The public key must be encoded in ssh-rsa format or PEM format.
    status : str, default is Undefined, optional
        The status to assign to the SSH public key. Active means the key can be used for authentication with an AWS CodeCommit repository. Inactive means the key cannot be used. Default is active.
    username : str, default is Undefined, optional
        The name of the IAM user to associate the SSH public key with.
    usernameRef : IamAwsUpboundIoV1beta1UserSSHKeySpecForProviderUsernameRef, default is Undefined, optional
        username ref
    usernameSelector : IamAwsUpboundIoV1beta1UserSSHKeySpecForProviderUsernameSelector, default is Undefined, optional
        username selector
    """


    encoding?: str

    publicKey?: str

    status?: str

    username?: str

    usernameRef?: IamAwsUpboundIoV1beta1UserSSHKeySpecForProviderUsernameRef

    usernameSelector?: IamAwsUpboundIoV1beta1UserSSHKeySpecForProviderUsernameSelector


schema IamAwsUpboundIoV1beta1UserSSHKeySpecForProviderUsernameRef:
    r"""
    Reference to a User in iam to populate username.

    Attributes
    ----------
    name : str, default is Undefined, required
        Name of the referenced object.
    policy : IamAwsUpboundIoV1beta1UserSSHKeySpecForProviderUsernameRefPolicy, default is Undefined, optional
        policy
    """


    name: str

    policy?: IamAwsUpboundIoV1beta1UserSSHKeySpecForProviderUsernameRefPolicy


schema IamAwsUpboundIoV1beta1UserSSHKeySpecForProviderUsernameRefPolicy:
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


schema IamAwsUpboundIoV1beta1UserSSHKeySpecForProviderUsernameSelector:
    r"""
    Selector for a User in iam to populate username.

    Attributes
    ----------
    matchControllerRef : bool, default is Undefined, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, default is Undefined, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : IamAwsUpboundIoV1beta1UserSSHKeySpecForProviderUsernameSelectorPolicy, default is Undefined, optional
        policy
    """


    matchControllerRef?: bool

    matchLabels?: {str:str}

    policy?: IamAwsUpboundIoV1beta1UserSSHKeySpecForProviderUsernameSelectorPolicy


schema IamAwsUpboundIoV1beta1UserSSHKeySpecForProviderUsernameSelectorPolicy:
    r"""
    Policies for selection.

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


schema IamAwsUpboundIoV1beta1UserSSHKeySpecInitProvider:
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
    encoding : str, default is Undefined, optional
        Specifies the public key encoding format to use in the response. To retrieve the public key in ssh-rsa format, use SSH. To retrieve the public key in PEM format, use PEM.
    publicKey : str, default is Undefined, optional
        The SSH public key. The public key must be encoded in ssh-rsa format or PEM format.
    status : str, default is Undefined, optional
        The status to assign to the SSH public key. Active means the key can be used for authentication with an AWS CodeCommit repository. Inactive means the key cannot be used. Default is active.
    username : str, default is Undefined, optional
        The name of the IAM user to associate the SSH public key with.
    usernameRef : IamAwsUpboundIoV1beta1UserSSHKeySpecInitProviderUsernameRef, default is Undefined, optional
        username ref
    usernameSelector : IamAwsUpboundIoV1beta1UserSSHKeySpecInitProviderUsernameSelector, default is Undefined, optional
        username selector
    """


    encoding?: str

    publicKey?: str

    status?: str

    username?: str

    usernameRef?: IamAwsUpboundIoV1beta1UserSSHKeySpecInitProviderUsernameRef

    usernameSelector?: IamAwsUpboundIoV1beta1UserSSHKeySpecInitProviderUsernameSelector


schema IamAwsUpboundIoV1beta1UserSSHKeySpecInitProviderUsernameRef:
    r"""
    Reference to a User in iam to populate username.

    Attributes
    ----------
    name : str, default is Undefined, required
        Name of the referenced object.
    policy : IamAwsUpboundIoV1beta1UserSSHKeySpecInitProviderUsernameRefPolicy, default is Undefined, optional
        policy
    """


    name: str

    policy?: IamAwsUpboundIoV1beta1UserSSHKeySpecInitProviderUsernameRefPolicy


schema IamAwsUpboundIoV1beta1UserSSHKeySpecInitProviderUsernameRefPolicy:
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


schema IamAwsUpboundIoV1beta1UserSSHKeySpecInitProviderUsernameSelector:
    r"""
    Selector for a User in iam to populate username.

    Attributes
    ----------
    matchControllerRef : bool, default is Undefined, optional
        MatchControllerRef ensures an object with the same controller reference
        as the selecting object is selected.
    matchLabels : {str:str}, default is Undefined, optional
        MatchLabels ensures an object with matching labels is selected.
    policy : IamAwsUpboundIoV1beta1UserSSHKeySpecInitProviderUsernameSelectorPolicy, default is Undefined, optional
        policy
    """


    matchControllerRef?: bool

    matchLabels?: {str:str}

    policy?: IamAwsUpboundIoV1beta1UserSSHKeySpecInitProviderUsernameSelectorPolicy


schema IamAwsUpboundIoV1beta1UserSSHKeySpecInitProviderUsernameSelectorPolicy:
    r"""
    Policies for selection.

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


schema IamAwsUpboundIoV1beta1UserSSHKeySpecProviderConfigRef:
    r"""
    ProviderConfigReference specifies how the provider that will be used to
    create, observe, update, and delete this managed resource should be
    configured.

    Attributes
    ----------
    name : str, default is Undefined, required
        Name of the referenced object.
    policy : IamAwsUpboundIoV1beta1UserSSHKeySpecProviderConfigRefPolicy, default is Undefined, optional
        policy
    """


    name: str

    policy?: IamAwsUpboundIoV1beta1UserSSHKeySpecProviderConfigRefPolicy


schema IamAwsUpboundIoV1beta1UserSSHKeySpecProviderConfigRefPolicy:
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


schema IamAwsUpboundIoV1beta1UserSSHKeySpecPublishConnectionDetailsTo:
    r"""
    PublishConnectionDetailsTo specifies the connection secret config which
    contains a name, metadata and a reference to secret store config to
    which any connection details for this managed resource should be written.
    Connection details frequently include the endpoint, username,
    and password required to connect to the managed resource.

    Attributes
    ----------
    configRef : IamAwsUpboundIoV1beta1UserSSHKeySpecPublishConnectionDetailsToConfigRef, default is Undefined, optional
        config ref
    metadata : IamAwsUpboundIoV1beta1UserSSHKeySpecPublishConnectionDetailsToMetadata, default is Undefined, optional
        metadata
    name : str, default is Undefined, required
        Name is the name of the connection secret.
    """


    configRef?: IamAwsUpboundIoV1beta1UserSSHKeySpecPublishConnectionDetailsToConfigRef

    metadata?: IamAwsUpboundIoV1beta1UserSSHKeySpecPublishConnectionDetailsToMetadata

    name: str


schema IamAwsUpboundIoV1beta1UserSSHKeySpecPublishConnectionDetailsToConfigRef:
    r"""
    SecretStoreConfigRef specifies which secret store config should be used
    for this ConnectionSecret.

    Attributes
    ----------
    name : str, default is Undefined, required
        Name of the referenced object.
    policy : IamAwsUpboundIoV1beta1UserSSHKeySpecPublishConnectionDetailsToConfigRefPolicy, default is Undefined, optional
        policy
    """


    name: str

    policy?: IamAwsUpboundIoV1beta1UserSSHKeySpecPublishConnectionDetailsToConfigRefPolicy


schema IamAwsUpboundIoV1beta1UserSSHKeySpecPublishConnectionDetailsToConfigRefPolicy:
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


schema IamAwsUpboundIoV1beta1UserSSHKeySpecPublishConnectionDetailsToMetadata:
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


schema IamAwsUpboundIoV1beta1UserSSHKeySpecWriteConnectionSecretToRef:
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


schema IamAwsUpboundIoV1beta1UserSSHKeyStatus:
    r"""
    UserSSHKeyStatus defines the observed state of UserSSHKey.

    Attributes
    ----------
    atProvider : IamAwsUpboundIoV1beta1UserSSHKeyStatusAtProvider, default is Undefined, optional
        at provider
    conditions : [IamAwsUpboundIoV1beta1UserSSHKeyStatusConditionsItems0], default is Undefined, optional
        Conditions of the resource.
    observedGeneration : int, default is Undefined, optional
        ObservedGeneration is the latest metadata.generation
        which resulted in either a ready state, or stalled due to error
        it can not recover from without human intervention.
    """


    atProvider?: IamAwsUpboundIoV1beta1UserSSHKeyStatusAtProvider

    conditions?: [IamAwsUpboundIoV1beta1UserSSHKeyStatusConditionsItems0]

    observedGeneration?: int


schema IamAwsUpboundIoV1beta1UserSSHKeyStatusAtProvider:
    r"""
    iam aws upbound io v1beta1 user SSH key status at provider

    Attributes
    ----------
    encoding : str, default is Undefined, optional
        Specifies the public key encoding format to use in the response. To retrieve the public key in ssh-rsa format, use SSH. To retrieve the public key in PEM format, use PEM.
    fingerprint : str, default is Undefined, optional
        The MD5 message digest of the SSH public key.
    id : str, default is Undefined, optional
        id
    publicKey : str, default is Undefined, optional
        The SSH public key. The public key must be encoded in ssh-rsa format or PEM format.
    sshPublicKeyId : str, default is Undefined, optional
        The unique identifier for the SSH public key.
    status : str, default is Undefined, optional
        The status to assign to the SSH public key. Active means the key can be used for authentication with an AWS CodeCommit repository. Inactive means the key cannot be used. Default is active.
    username : str, default is Undefined, optional
        The name of the IAM user to associate the SSH public key with.
    """


    encoding?: str

    fingerprint?: str

    id?: str

    publicKey?: str

    sshPublicKeyId?: str

    status?: str

    username?: str


schema IamAwsUpboundIoV1beta1UserSSHKeyStatusConditionsItems0:
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


